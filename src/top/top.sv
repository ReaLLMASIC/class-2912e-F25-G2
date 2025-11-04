module top (
    input logic clk,
    input logic rst_n_in
);

localparam NUM_PIXELS = 32;
localparam SRAM_SIZE = 16;
localparam SRAM_ADDR_SIZE = 9;
localparam COUNTER_N = 8;

//col_row_logic signals
logic [NUM_PIXELS-1:0] column_read;
logic [NUM_PIXELS-1:0] row_read;
//pooling unit signals
logic [7:0] pooling_data_in;
logic pooling_mode;
logic [7:0] pooling_mu;
logic [SRAM_ADDR_SIZE-1:0] sram_read_addr;
//counter signals
logic [1:0] counter_up_down;
logic [COUNTER_N-1:0] counter_start_value;
logic [COUNTER_N-1:0] counter_value_out;
logic [COUNTER_N-1:0] counter_value_inv_out;
//readout buffer signals
logic readout_buffer_src;
logic readout_buffer_en;
logic [COUNTER_N-1:0] readout_mem_in;
logic [COUNTER_N-1:0] readout_pix_in;
logic [COUNTER_N-1:0] readout_buffered_out;
//regfile signals
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
    .rst_n (rst_n),
    .column_out (column_read),
    .row_out (row_read)
);

pooling #(
    .SRAM_SIZE (SRAM_SIZE)
) pooling_inst (
    .clk (clk),
    .rst_n (rst_n),
    .in_data (pooling_data_in),
    .mode (pooling_mode),
    .mu (pooling_mu),
    .sram_read_addr (sram_read_addr)
);

counter #(
    .N (COUNTER_N)
) counter_inst (
    .clk (clk),
    .rst_n (rst_n),
    .up_down (counter_up_down),
    .start_value (counter_start_value),
    .value (counter_value_out),
    .value_inv (counter_value_inv_out)
);

readout_buffer #(
    .N (COUNTER_N)
) readout_buffer_inst (
    .clk (clk),
    .rst_n (rst_n),
    .src (readout_buffer_src),
    .en (readout_buffer_en),
    .value_mem (readout_mem_in),
    .value_pix (readout_pix_in),
    .out_value (readout_buffered_out)
);

regfile (
    .clk (clk),
    .reset (rst_n),
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

endmodule