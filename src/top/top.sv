module top #(
    parameter N = 8,
    parameter NUM_PIXELS = 32, //despite the name, this is num pixels in one direction
)(
    input logic clk,
    input logic rst_n_in,
    input logic pixel_mode, //select pixel or test data
    input logic req_frame, //for requesting frame data from regfile
    output logic [N-1:0] frame_data_out,

    //compare phase signals for analog portion
    output [N-1:0] counter_value_out,
    input logic pixel_comparator_in //assuming 0 for counter<pixel, 1 for counter>pixel
    output [NUM_PIXELS-1:0] column_out,
    output [NUM_PIXELS-1:0] row_out,
);

//localparam NUM_PIXELS = 32;
localparam SRAM_SIZE = 16;
localparam SRAM_ADDR_SIZE = 9;
//localparam N = 8;

localparam CAPTURE_DELAY_CYCLES = 500;
localparam TOTAL_PIXELS = NUM_PIXELS * NUM_PIXELS;

//col_row_logic signals
logic col_row_rst_n;
logic [NUM_PIXELS-1:0] column_read;
logic [NUM_PIXELS-1:0] row_read;
//pooling unit signals
logic pooling_rst_n;
logic [7:0] pooling_data_in;
logic pooling_mode;
logic [7:0] pooling_mu;
logic [SRAM_ADDR_SIZE-1:0] sram_read_addr;
//counter signals
logic counter_rst_n;
logic counter_up_down;
logic [N-1:0] counter_start_value;
//logic [N-1:0] counter_value_out; //declared in port list
logic [N-1:0] counter_value_inv_out;
//readout buffer signals
logic readout_buffer_rst_n;
logic readout_buffer_src;
logic readout_buffer_en;
logic [N-1:0] readout_mem_in;
logic [N-1:0] readout_pix_in;
logic [N-1:0] readout_buffered_out;
//regfile signals
logic regfile_rst_n;
logic [9:0] reg_wr_addr;
logic [9:0] reg_rd_addr1;
logic [9:0] reg_rd_addr2;
logic reg_wr_enable;
logic reg_rd_enable;
logic [7:0] reg_in;
logic [7:0] reg_out1;
logic [7:0] reg_out2;

//instantiate all submodules
col_row_logic col_row_logic_inst (
    .clk (clk),
    .rst_n (col_row_rst_n),
    .column_out (column_read),
    .row_out (row_read)
);

pooling #(
    .SRAM_SIZE (SRAM_SIZE)
) pooling_inst (
    .clk (clk),
    .rst_n (pooling_rst_n),
    .in_data (pooling_data_in),
    .mode (pooling_mode),
    .sram_sel_x (sram_sel_x),
    .sram_sel_y (sram_sel_y),
    .mu (pooling_mu)
);

counter #(
    .N (N)
) counter_inst (
    .clk (clk),
    .rst_n (counter_rst_n),
    .up_down (counter_up_down),
    .start_value (counter_start_value),
    .value (counter_value_out),
    .value_inv (counter_value_inv_out)
);

readout_buffer #(
    .N (N)
) readout_buffer_inst (
    .clk (clk),
    .rst_n (readout_buffer_rst_n),
    .src (readout_buffer_src),
    .en (readout_buffer_en),
    .value_mem (readout_mem_in),
    .value_pix (readout_pix_in),
    .out_value (readout_buffered_out)
);

regfile (
    .clk (clk),
    .reset (regfile_rst_n),
    .wr_addr (reg_wr_addr),
    .rd_addr1 (reg_rd_addr1),
    .rd_addr2 (reg_rd_addr2),
    .wr_enable (reg_wr_enable),
    .rd_enable (reg_rd_enable),
    .in (reg_in),
    .out1 (reg_out1),
    .out2 (reg_out2)
);

//reset release synchronizer
logic rst_n;
assign rst_n = rst_sync[0];
reg [1:0] rst_sync;
always @(posedge clk or posedge rst_n_in) begin
    if (~rst_n_in) begin
        rst_sync <= 2'b00;
    end
    else begin
        rst_sync <= {1'b1, rst_sync[1]};
    end
end

//state type definition
typedef enum logic [2:0] {
    RESET, 
    CAPTURE,
    COMPARISON,
    DECISION,
    REGFILE_WR
} state_type;

state_type current_state, next_state;

//state machine reset and next state progression
always_ff @(posedge clk or negedge rst_n) begin

    if (~rst_n) begin
        current_state <= RESET;
    end
    else begin
        current_state <= next_state;
    end

end

logic [15:0] capture_delay_count;
logic [15:0] current_pixel_index;
logic counter_phase; //for reseting the counter between pixels, 0 for reset, 1 for counting
logic [TOTAL_PIXELS-1:0] sram [N-1:0];
logic [N-1:0] previous_mu;
logic wr_frame; //tells REGFILE_WR to write current frame to regfile

always @(posedge clk or negedge rst_n) begin

    if (current_state = RESET) begin
        //reset goes here
        next_state <= CAPTURE;
        capture_delay_count <= 1'b0;
        col_row_rst_n <= 1'b0;
        counter_rst_n <= 1'b0;
        pooling_rst_n <= 1'b0;
        readout_buffer_rst_n <= 1'b0;
        regfile_rst_n <= 1'b0;

        counter_start_value <= 0;
        counter_up_down <= 1'b1;

        pooling_mode <= 1; //max mode
        previous_mu <= 0;

        reg_wr_enable <= 0;
        reg_rd_enable <= 0;
        wr_frame <= 1'b0;

        for (int i = 0; i < TOTAL_PIXELS; i++) begin
            sram[i] <= 0;
        end
    end


    else if (current_state = CAPTURE) begin
        //capture goes here
        //makes sure delay is proper length
        if (capture_delay_count >= CAPTURE_DELAY_CYCLES) begin
            next_state <= COMPARISON;
            //initialization for next capture phase
            capture_delay_count <= 0;
            //initialization for comparison phase
            current_pixel_index <= 0;
        end
        else begin
            capture_delay_count <= capture_delay_count + 1;
        end

    end


    else if (current_state = COMPARISON) begin
        //on initial entry, col_row_rst_n and counter_rst_n will be 0
        //start col_row shift registers
        col_row_rst_n <= 1; 
        //if all pixels have been saved, move on to decision phase, otherwise get next pixel data
        if (current_pixel_index < TOTAL_PIXELS) begin
            //if counter is in reset, we're starting new pixel, turn off reset
            if(~counter_rst_n) begin
                counter_rst_n <= 1'b1;
            end
            else begin
                //if the counter has exceeded pixel value, write value to sram
                if(pixel_comparator_in) begin
                    //reset counter for next pixel
                    counter_rst_n <= 1'b0;
                    sram[current_pixel_index] <= counter_value_out;
                end
            end

        end
        else begin
            next_state <= DECISION;
            col_row_rst_n <= 1'b0;
            counter_rst_n <= 1'b0;
            //initialization for decision phase
            current_pixel_index <= 0;
        end

    end


    else if (current_state = DECISION) begin
        //turn off pooling reset
        pooling_rst_n <= 1;
        //iterating through all pixels
        if (current_pixel_index < TOTAL_PIXELS) begin
            //provide current pixel value
            pooling_data_in <= sram[current_pixel_index];
            //provide current pixel x and y coordinates for weighting logic
            sram_sel_x <= ((current_pixel_index+1) % NUM_PIXELS) - 1;
            sram_sel_y <= ((current_pixel_index + 1) >> $clog2(NUM_PIXELS)) - 1;
            current_pixel_index <= current_pixel_index + 1;
        end
        else begin
            //if my was larger than previous mu, next state is REGFILE_WR to write from to regfile
            //will also go to REGFILE_WR if frame is requested
            if (pooling_mu > previous_mu & ~req_frame) begin
                previous_mu <= pooling_mu;
                next_state <= REGFILE_WR;
                pooling_rst_n <= 1'b0;
                wr_frame <= 1'b1;
            end
            //if frame is not of interest, return to capture phase
            else begin
                next_state <= CAPTURE;
                pooling_rst_n <= 1'b0;
                current_pixel_index <= 0;
            end
        end
    end


    else if (current_state = REGFILE_WR) begin
        //iterate through all pixels
        if (current_pixel_index < NUM_PIXELS) begin
            //if wr_frame is 1, write current pixel to regfile
            if (wr_frame) begin
                reg_wr_enable <= 1'b1;
                reg_wr_addr <= current_pixel_index;
                reg_in <= sram[current_pixel_index];
            end
            //if frame is requested, read pixel from regfile to output
            if (req_frame) begin
                reg_rd_enable <= 1'b1;
                reg_rd_addr1 <= current_pixel_index;
                frame_data_out <= reg_out1;
            end
            current_pixel_index <= current_pixel_index + 1;

        end
        else begin
            //move on to next capture phase
            next_state <= CAPTURE;
            current_pixel_index <= 0;
            wr_frame <= 1'b0;
            reg_wr_enable <= 1'b0;
            reg_rd_enable <= 1'b0;
        end
    end


end


endmodule