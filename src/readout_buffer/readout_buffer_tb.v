`timescale 1ns / 1ps

module testbench;

    reg clk;
    reg rst_n;
    reg src;
    reg en;
    reg [7:0] value_mem;
    reg [7:0] value_pix;
    wire [7:0] out_value;

    // DUT instantiation
    readout_buffer uut (
        .clk(clk),
        .rst_n(rst_n),
        .src(src),
        .en(en),
        .value_mem(value_mem),
        .value_pix(value_pix),
        .out_value(out_value)
    );

    // Clock generation: 10 ns period
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("readout_buffer.vcd");
        $dumpvars(0, testbench);

        // Initialize
        rst_n = 1;
        src = 0;
        en = 0;
        value_mem = 8'h00;
        value_pix = 8'h00;

        // --- Apply async reset ---
        #3 rst_n = 0;
        #7 rst_n = 1;

        // --- Test 1: Load from memory (SRC=0), enable active ---
        en = 1;
        src = 0;
        value_mem = 8'hA1;
        #10;
        value_mem = 8'hB2;
        #10;

        // --- Test 2: Switch to pixel source (SRC=1) ---
        src = 1;
        value_pix = 8'hC3;
        #10;
        value_pix = 8'hD4;
        #10;

        // --- Test 3: Disable enable signal (en=0), output should hold ---
        en = 0;
        value_mem = 8'hE5;
        value_pix = 8'hF6;
        #20;

        // --- Test 4: Re-enable, source=memory ---
        en = 1;
        src = 0;
        value_mem = 8'h11;
        #20;

        $finish;
    end

endmodule
