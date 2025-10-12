`timescale 1ns / 1ps

module readout_buffer #(
    parameter N = 8
)(
    input  wire             clk,
    input  wire             rst_n,       // Active-low asynchronous reset
    input  wire             src,         // 0: memory, 1: pixel
    input  wire             en,          // Synchronous enable
    input  wire [N-1:0]     value_mem,   // Memory value input
    input  wire [N-1:0]     value_pix,   // Pixel value input
    output reg  [N-1:0]     out_value    // Buffered output
);

    reg [N-1:0] selected_value;

    // Combinational MUX to choose between pixel and memory source
    always @(*) begin
        if (src)
            selected_value = value_pix;
        else
            selected_value = value_mem;
    end

    // Asynchronous reset + synchronous update
    always @(negedge rst_n or posedge clk) begin
        if (!rst_n)
            out_value <= {N{1'b0}};
        else if (en)
            out_value <= selected_value;
        else
            out_value <= out_value; // Hold current value
    end

endmodule
