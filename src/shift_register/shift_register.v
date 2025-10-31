module shift_register #(
    parameter N = 32
)(
    input  wire clk,
    input  wire rst,
    input  wire din,
    output wire dout,
    output wire [N-1:0] data_out   // optional: access all stages
);

    reg [N-1:0] shift_reg;

    always @(negedge rst or posedge clk) begin
        if (!rst)
            shift_reg <= {N{1'b0}};
        else
            shift_reg <= {shift_reg[N-2:0], din};
    end

    assign dout = shift_reg[N-1];
    assign data_out = shift_reg;

endmodule
