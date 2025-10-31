`timescale 1ns / 1ps

module tb_shift_register;

    // Parameters
    localparam N = 32;

    // Testbench signals
    reg clk;
    reg rst;
    reg din;
    wire dout;
    wire [N-1:0] data_out;

    // DUT instantiation
    shift_register #(.N(N)) uut (
        .clk(clk),
        .rst(rst),
        .din(din),
        .dout(dout),
        .data_out(data_out)
    );

    // Clock generation (period = 10 ns)
    always #5 clk = ~clk;

    // Task to apply one bit
    task shift_bit(input bit in_bit);
        begin
            din = in_bit;
            @(posedge clk);
            #1; // small delay for data to settle
            $display("[%0t] din=%b dout=%b data_out=%b", $time, din, dout, data_out);
        end
    endtask

    // Test sequence
    initial begin
        // ---- VCD dump setup ----
        $dumpfile("shift_register.vcd");      // name of the dump file
        $dumpvars(0, tb_shift_register); // dump all signals in this testbench and below

        $display("---- Starting Shift Register Test ----");

        // Initialize
        clk = 0;
        din = 0;
        rst = 0;
        #10;

        // Release reset
        rst = 1;
        #10;

        // Shift in a known pattern (e.g., 1101)
        $display("Shifting bits 1,1,0,1...");
        shift_bit(1);
        shift_bit(1);
        shift_bit(0);
        shift_bit(1);

        // Continue with random bits
        $display("Shifting random bits...");
        repeat (10) begin
            shift_bit($random % 2);
        end

        // Display final state
        $display("Final shift register contents: %b", data_out);

        // Reset again to test clear
        $display("Asserting reset...");
        rst = 0;
        #5;
        rst = 1;
        @(posedge clk);
        if (data_out == 0)
            $display("Reset successful!");
        else
            $display("Reset failed: data_out = %b", data_out);

        $display("---- Test Completed ----");
        $finish;
    end

endmodule
