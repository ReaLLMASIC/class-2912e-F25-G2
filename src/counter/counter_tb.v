`timescale 1ns / 1ps

module testbench;

    reg clk;
    reg rst_n;
    reg [1:0] up_down;
    reg [7:0] start_value;
    wire [7:0] value;
    wire [7:0] value_inv;

    // Instantiate DUT
    counter uut (
        .clk(clk),
        .rst_n(rst_n),
        .up_down(up_down),
        .start_value(start_value),
        .value(value),
        .value_inv(value_inv)
    );

    // Clock: 10 ns period (100 MHz)
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("counter.vcd");
        $dumpvars(0, testbench);

        // --- Initialization ---
        rst_n = 1;
        up_down = 2'b00;
        start_value = 8'h00;

        // --- Apply async reset ---
        #3 rst_n = 0;
        #7 rst_n = 1;

        // --- Test 1: Load start value = 0x32 and count UP ---
        start_value = 8'h32;
        up_down = 2'b10;   // Load start value
        #20;               // Wait 2 cycles
        up_down = 2'b01;   // Count up
        #80;               // Observe counting

        // --- Test 2: Count DOWN from current value ---
        up_down = 2'b00;
        #80;

        // --- Test 3: Load new start value = 0xC8 (200) and count DOWN ---
        start_value = 8'hC8;
        up_down = 2'b10;   // Load start
        #20;
        up_down = 2'b00;   // Count down
        #80;

        // --- Test 4: Load + Count UP immediately (up_down = 2'b11) ---
        start_value = 8'hA0;
        up_down = 2'b11;   // Load start and count up
        #100;

        $finish;
    end

endmodule
