module col_row_logic #(
    parameter NUM_PIXELS = 32
) (
    input logic clk,
    input logic rst_n,
    output logic [NUM_PIXELS-1:0] column_out,
    output logic [NUM_PIXELS-1:0] row_out
);

logic [5:0] col_counter;

always @(posedge clk or negedge rst_n) begin

    if(~rst_n) begin

        column_out <= NUM_PIXELS'b1;
        row_out <= NUM_PIXELS'b1;
        col_counter <= 0;

    end

    else begin

        if(col_counter == 31) begin
            col_counter <= 0;
            column_out <= {column_out[NUM_PIXELS-2:0], column_out[NUM_PIXELS-1]};
        end

        else begin
            col_counter <= col_counter + 1;
        end

        row_out <= {row_out[NUM_PIXELS-1:0], row_out[NUM_PIXELS-1]};

    end

end


endmodule