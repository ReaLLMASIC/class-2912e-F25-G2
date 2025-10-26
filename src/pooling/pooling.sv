module pooling 
(
    input logic clk,
    input logic rst_n,
    input logic [7:0] in_data,
    input logic mode,
    output logic [7:0] mu
)

localparam DATA_WIDTH = 8;
localparam NUM_SAMPLES = 64;
localparam PTR_WIDTH = $clog2(NUM_SAMPLES);
localparam SUM_WIDTH = DATA_WIDTH + PTR_WIDTH;

//signals for rolling average
logic [DATA_WIDTH-1:0] history [NUM_SAMPLES-1:0];
logic [PTR_WIDTH-1:0] wr_ptr;
logic [SUM_WIDTH-1:0] avg_sum;

//signals for max
logic [7:0] max;

    always_ff @(posedge clk or negedge rst_n) begin
        
        if (~rst_n) begin

            mu <= 0;

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
