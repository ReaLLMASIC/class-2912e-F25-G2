`timescale 1ns / 1ps

module tb_pooling;

    // --- Parameters ---
    localparam CLK_PERIOD  = 10; // 10ns clock period (100MHz)
    localparam DATA_WIDTH  = 8;
    localparam NUM_SAMPLES = 64;
    localparam PTR_WIDTH   = $clog2(NUM_SAMPLES);
    localparam SUM_WIDTH   = DATA_WIDTH + PTR_WIDTH;
    
    // --- Testbench Signals ---
    logic        clk;
    logic        rst_n;
    logic [7:0]  in_data;
    logic        mode;
    logic [7:0]  mu;      // Output from DUT

    // --- DUT Instantiation ---
    pooling i_dut (
        .clk     (clk),
        .rst_n   (rst_n),
        .in_data (in_data),
        .mode    (mode),
        .mu      (mu)
    );

    // --- Clock Generator ---
    initial begin
        clk = 0;
        forever #(CLK_PERIOD / 2) clk = ~clk;
    end

    // --- Reference Model ---
    // These registers mirror the DUT's internal state
    logic [SUM_WIDTH-1:0]  tb_avg_sum;
    logic [PTR_WIDTH-1:0]  tb_wr_ptr;
    logic [DATA_WIDTH-1:0] tb_history [NUM_SAMPLES-1:0];
    logic [DATA_WIDTH-1:0] tb_max;
    
    // This register models the DUT's 'mu' output register
    logic [DATA_WIDTH-1:0] expected_mu;

    /**
     * @brief Behavioral reference model of the pooling module.
     *
     * This always_ff block runs in parallel to the DUT and models
     * its exact internal logic and output latency.
     */
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // Reset the reference model state
            tb_avg_sum <= '0;
            tb_wr_ptr  <= '0;
            for (int i = 0; i < NUM_SAMPLES; i++) tb_history[i] <= '0;
            tb_max      <= '0;
            expected_mu <= '0;
        end else begin
            // Model the DUT's logic from the 'always_ff' block
            if (mode) begin
                // --- Max Mode Model ---
                if (in_data > tb_max) begin
                    tb_max <= in_data;
                end
                // Model the output register: mu <= max
                // This uses the *previous* cycle's 'tb_max'
                expected_mu <= tb_max; 
            end else begin
                // --- Average Mode Model ---
                
                // Model the output register: mu <= avg_sum[SUM_WIDTH-1:PTR_WIDTH]
                // This uses the *previous* cycle's 'tb_avg_sum'
                expected_mu <= tb_avg_sum[SUM_WIDTH-1:PTR_WIDTH];

                // Now, model the *next state* calculation for the sum
                tb_avg_sum <= tb_avg_sum - tb_history[tb_wr_ptr] + in_data;
                
                // Model the state updates for history and pointer
                tb_history[tb_wr_ptr] <= in_data;
                tb_wr_ptr             <= tb_wr_ptr + 1;
            end
        end
    end

    // --- Checker ---
    logic test_passed;
    always @(posedge clk) begin
        // Give a tiny #1 delay for DUT output to propagate
        #1;
        // Only start checking *after* reset is de-asserted
        if ($time > (CLK_PERIOD * 3)) begin 
            if (mu !== expected_mu) begin
                $error("CHECK FAILED: Time=%t, mode=%b, in_data=%d. DUT mu=%d, Expected mu=%d",
                       $time, mode, in_data, mu, expected_mu);
                test_passed = 1'b0;
                $stop; // Stop simulation on first error
            end
        end
    end

    // --- Test Sequence Task ---
    task wait_cycles(input int num_cycles);
        repeat (num_cycles) @(posedge clk);
    endtask

    // --- Test Sequence ---
    initial begin
        $display("--- Testbench Started ---");
        test_passed = 1'b1; // Assume pass until failure
        
        // 1. Initialize and Reset
        $display("Test 1: Reset");
        in_data = '0;
        mode    = '0;
        rst_n   = 1'b1;
        @(posedge clk);
        rst_n   = 1'b0; // Assert active-low reset
        wait_cycles(3);
        rst_n   = 1'b1; // De-assert reset
        wait_cycles(2);

        // 2. Test Average Mode (mode=0)
        $display("Test 2a: Average Mode (Constant Input)");
        mode = 0;
        in_data = 100;
        // Wait for buffer to fill (64) + 1 cycle latency + extra
        wait_cycles(70);
        
        $display("Test 2b: Average Mode (Alternating Input)");
        // Fill buffer with 32x '0' and 32x '128'
        // Expected average = (32*0 + 32*128) / 64 = 64
        in_data = 0;
        wait_cycles(32);
        in_data = 128;
        wait_cycles(32);
        // Let it run for another 64 cycles to ensure stability
        wait_cycles(64);

        // 3. Test Max Mode (mode=1)
        $display("Test 3: Max Mode (Ramping Input)");
        mode = 1;
        in_data = 10; wait_cycles(1);
        in_data = 20; wait_cycles(1);
        in_data = 30; wait_cycles(1);
        in_data = 15; wait_cycles(1); // Max should hold at 30
        in_data = 40; wait_cycles(1); // New max
        wait_cycles(5);

        // 4. Test Mode Switching (Avg -> Max)
        $display("Test 4: Mode Switch (Avg -> Max)");
        // First, establish a stable average
        mode = 0;
        in_data = 50;
        wait_cycles(70); // mu should now be 50
        
        // Now, switch to Max mode
        mode = 1;
        in_data = 20; wait_cycles(1); // max_reg=20, mu=0 (from tb_max reset)
        in_data = 30; wait_cycles(1); // max_reg=30, mu=20
        in_data = 25; wait_cycles(1); // max_reg=30, mu=30

        // 5. Test Mode Switching (Max -> Avg)
        $display("Test 5: Mode Switch (Max -> Avg)");
        // We are in max mode, max is 30.
        // The average buffer is full of '50's. avg_sum = 3200
        mode = 0;
        in_data = 60; // old_data=50. new_sum=3200-50+60=3210.
        wait_cycles(1); // mu=50 (last avg calc)
        // new_sum=3210. mu = 3210/64 = 50
        in_data = 60;
        wait_cycles(1);
        
        // 6. Final Check
        wait_cycles(10);
        if (test_passed) begin
            $display("--- ALL CHECKS PASSED ---");
        end else begin
            $display("--- TEST FAILED ---");
        end
        $finish;
    end

endmodule
