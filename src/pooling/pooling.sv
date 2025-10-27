module pooling #(
    parameter SRAM_SIZE = 16
) 
(
    input logic clk,
    input logic rst_n,
    input logic [7:0] in_data,
    input logic mode,
    output logic [7:0] mu,
    output logic [SRAM_SIZE-1:0] sram_sel_x, //figure out if this should be one hot encoding or not
    output logic [SRAM_SIZE-1:0] sram_sel_y

)

localparam DATA_WIDTH = 8;
localparam NUM_SAMPLES = 64;
localparam PTR_WIDTH = $clog2(NUM_SAMPLES);
localparam SUM_WIDTH = DATA_WIDTH + PTR_WIDTH;

logic complete_rst;
logic [7:0] weighted_data_in;

//signals for rolling average
logic [DATA_WIDTH-1:0] history [NUM_SAMPLES-1:0];
logic [PTR_WIDTH-1:0] wr_ptr;
logic [SUM_WIDTH-1:0] avg_sum;

//signals for max
logic [7:0] max;

    always_ff @(posedge clk or negedge rst_n) begin

        //logic for selecting which pixel to input
        if (sram_sel_x < SRAM_SIZE) sram_sel_x <= sram_sel_x + 1;
        else if (sram_sel_y < SRAM_SIZE) sram_sel_y <= sram_sel_y + 1;
        else begin
            sram_sel_x <= 1;
            sram_sel_y <= 1;
        end

        //logic for weighting input
        if ((sram_sel_x | sram_sel_y) == 1 | (sram_sel_x | sram_sel_y) == SRAM_SIZE) weighted_data_in <= in_data >> 2;
        //need to improve this logic (divisions)
        else if (((sram_sel_x > SRAM_SIZE/2 - SRAM_SIZE/4) | (sram_sel_x < SRAM_SIZE/2 + SRAM_SIZE/4)) & ((sram_sel_y > SRAM_SIZE/2 - SRAM_SIZE/4) | (sram_sel_y < SRAM_SIZE/2 + SRAM_SIZE/4))) weighted_data_in <= in_data << 2;
        else weighted_data_in <= in_data;
        
        if (~rst_n) begin

            mu <= 0;
            complete_rst <= 0;
            sram_sel_x <= 1;
            sram_sel_y <= 1;
            weighted_data_in <= 0;

            sum <= 0;
            max <= 0;

            wr_ptr <= 0;
            avg_sum <= 0;
            for (int i = 0; i < NUM_SAMPLES; i++) history[i] <= '0; //this might need to be removed, handled in else if logic

        end

        else if (~complete_rst) begin

            mu <= 0;
            complete_rst <= 1;
            sram_sel_x <= 1;
            sram_sel_y <= 1;
            weighted_data_in <= 1;

            sum <= 0;
            max <= 0;

            wr_ptr <= 0;
            avg_sum <= 0;
            for (int i = 0; i < NUM_SAMPLES; i++) history[i] <= '0;

        end

        else begin

            if (mode) begin

                //max logic goes here
                if (in_data > max) max <= in_data;
                mu <= max;

            end

            else begin

                //avg logic goes here
                avg_sum <= avg_sum - history[wr_ptr] + in_data;
                history[wr_ptr] <= in_data;
                wr_ptr <= wr_ptr + 1;

                mu <= avg_sum[SUM_WIDTH-1:PTR_WIDTH];

            end

        end


    end
    


endmodule
