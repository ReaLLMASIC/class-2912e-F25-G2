`timescale 1ns/1ps

module regfile(
    input clk,
    input reset,
    input [9:0] wr_addr,
    input [9:0] rd_addr1,
    input [9:0] rd_addr2,
    input wr_enable,
    input rd_enable,
    input [7:0] in,
    output reg [7:0] out1,
    output reg [7:0] out2
    );

    // Register array: 32x32 registers, 8-bit wide
    logic [7:0] registers [31:0][31:0];

    // async reset with sync release
    reg [1:0] rst_sync;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            rst_sync <= 2'b11;
        end else begin
            rst_sync <= {1'b0, rst_sync[1]};
        end
    end

    wire reset_signal = rst_sync[0];
    always @(posedge clk or posedge reset_signal) begin
        if (reset_signal) begin 
            out1 <=  8'b0;
            out2 <=  8'b0;
        end else begin 
            if (wr_enable == 1'b1) begin 
                registers[wr_addr[9:5]][wr_addr[4:0]] <= in;
            end 
            if (rd_enable == 1'b1) begin
                out1 <= registers[rd_addr1[9:5]][rd_addr1[4:0]];
                out2 <= registers[rd_addr2[9:5]][rd_addr2[4:0]];
            end
        end
    end


endmodule


