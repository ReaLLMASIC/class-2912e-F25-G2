`timescale 1ns / 1ps
module counter #(
    parameter N = 8
)(
    input wire clk,
    input wire rst_n,
    input wire [1:0] up_down,         // [load_start, direction]
    input wire [N-1:0] start_value,
    output reg [N-1:0] value
);
  
  reg load_prev;

  always @(negedge rst_n or posedge clk) begin
      if (!rst_n) begin
          value <= {N{1'b0}};
          load_prev <= 1'b0;
      end else begin
          // detect rising edge of load signal
          if (up_down[1] && !load_prev)
              value <= start_value;
          else if (up_down[0])
              value <= value + 1'b1;
          else
              value <= value - 1'b1;

          load_prev <= up_down[1];
      end
  end
 
endmodule
