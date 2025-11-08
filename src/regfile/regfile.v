`timescale 1ns/1ps

module regfile(
    input clk,
    input reset,
    input [9:0] wr_addr,
    input [9:0] rd_addr,
    input wr_enable,
    input rd_enable,
    input [7:0] in,
    output reg [7:0] out,
    );

    // Register array: 32x32 registers, 8-bit wide
    logic [7:0] registers [31:0][31:0];

    always @(posedge clk or posedge reset) begin
        if (reset) begin 
            out <=  8'b0;
        end else begin 
            if (wr_enable == 1'b1) begin 
                registers[wr_addr[9:5]][wr_addr[4:0]] <= in;
            end 
            if (rd_enable == 1'b1) begin
                out <= registers[rd_addr[9:5]][rd_addr[4:0]];
            end
        end
    end


endmodule

