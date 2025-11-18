`timescale 1ns / 1ps
module counter #(
    parameter N = 8
)(
    input wire clk,
    input wire rst_n,
    input wire up_down,         // [load_start, direction]
    input wire [N-1:0] start_value,
    output reg [N-1:0] value,
    output wire [N-1:0] value_inv
);
  

  always @(negedge rst_n or posedge clk) begin
      if (!rst_n) begin
          value <= start_value;
      end else begin
          if (up_down)
              value <= value + 1'b1;
          else
              value <= value - 1'b1;

      end
  end
 
  assign value_inv = ~value;

endmodule
