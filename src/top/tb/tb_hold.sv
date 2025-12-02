`timescale 1ns/1ps

module tb_top;

  localparam N = 8;
  localparam NUM_PIXELS = 32;
  localparam FRAME_SIZE = NUM_PIXELS*NUM_PIXELS;
  localparam CLK_PERIOD = 10;

  logic clk;
  logic rst_n_in;
  logic pixel_mode;
  logic source_sel;
  logic pixel_comparator_in;
  logic [N-1:0] frame_data_out;

  logic [N-1:0] fpa_out;
  logic [N-1:0] fpa_counter_signal;
  logic comparison;
  logic fpa_wr_enable;

  // testbench memory
  logic [N-1:0] frame_mem [0:FRAME_SIZE-1];

  // top #(
  //   .N(N),
  //   .NUM_PIXELS(NUM_PIXELS)
  // ) dut (
  top dut (
    .clk(clk),
    .rst_n_in(rst_n_in),
    .pixel_mode(pixel_mode),
    .source_sel(source_sel),
    .pixel_comparator_in(pixel_comparator_in),
    .frame_data_out(frame_data_out),
    .fpa_counter_signal(fpa_counter_signal),
    .fpa_out(fpa_out),
    .comparison(comparison),
    .fpa_wr_enable(fpa_wr_enable)
  );

  // -------------------------------------------------------------
  // Clock generation - simulation only
  // -------------------------------------------------------------
`ifndef SYNTHESIS
  initial clk = 0;
  always #(CLK_PERIOD/2) clk = ~clk;
`endif

  task automatic reset_dut();
    begin
      rst_n_in = 0;
      pixel_mode = 0;
      source_sel = 0;
      pixel_comparator_in = 0;
      repeat (5) @(posedge clk);
      rst_n_in = 1;
      @(posedge clk);
    end
  endtask

`ifndef SYNTHESIS
  logic [7:0] test_value = 15;
  integer index, errors;
  integer previous_value;
  integer threshold;

  initial begin
    reset_dut();

    pixel_mode = 1;
    source_sel = 0;
    errors = 0;
    previous_value = -500;

    threshold = 10;
    repeat(161) @(posedge clk);

    // repeat(1018) @(posedge clk);

    for (int i = 0; i < 5; i++) begin
      // wait the 3000-cycle latency for capture (plus extra for control)
      repeat(1000) @(posedge clk);

      repeat(1018) @(posedge clk);
      // wait for comparison phase
      repeat(358) @(posedge clk);
      // send output to pooling unit over 1024 cycles
      for (int i = 0; i < FRAME_SIZE; i++) begin
        @(posedge clk);
        force dut.fpa_out = test_value;  
      end
      // capture output
      
      repeat(12) @(posedge clk);
      
      // send output to register file over 1024 cycles
      for (int i = 0; i < FRAME_SIZE; i++) begin
        @(posedge clk);
        force dut.fpa_out = test_value;   
      end
      
      repeat(5) @(posedge clk);
      // read from regfile
      index = 0;
      for (int i = 0; i < FRAME_SIZE; i++) begin
        @(posedge clk);
        frame_mem[index++] = frame_data_out;
        // check results
        if (test_value - previous_value > threshold) begin
          if (frame_data_out !== test_value) begin
            $display("ERROR: index %0d got %0d expected %0d",
              i, frame_data_out, test_value);
            errors++;
          end
        end
        index++;
      end

      if (test_value - previous_value > threshold) begin
        previous_value = test_value;
      end
      test_value = test_value + 6; // second frame within threshold, third frame outside
      repeat(1024) @(posedge clk);
    end

    if (errors == 0)
      $display("PASS");
    else
      $display("FAIL: %0d errors", errors);

    $finish;
  end
`endif

endmodule
