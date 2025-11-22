`timescale 1ns/1ps

module tb_top;
  localparam N = 8;
  localparam NUM_PIXELS = 32;
  localparam FRAME_SIZE = NUM_PIXELS * NUM_PIXELS;
  localparam CLK_PERIOD = 10;

  logic                  clk;
  logic                  rst_n_in;
  logic                  pixel_mode;
  logic                  req_frame;
  logic                  source_sel;
  logic [N-1:0]          frame_data_out;

  logic [N-1:0]          counter_value_out;
  logic                  pixel_comparator_in;
  logic [NUM_PIXELS-1:0] column_out;
  logic [NUM_PIXELS-1:0] row_out;
  logic                  source_sel_out;

  // FPA signals
  logic [N-1:0] fpa_out;
  logic [N-1:0] fpa_counter_signal;
  logic comparison;
  
  logic [N-1:0]               frame_mem [FRAME_SIZE-1:0];
  int index;
  int errors;

  logic [N-1:0] test_value = 8'hA5; // example test value
  logic [15:0] cycle_counter;

  top #(
      .N(N),
      .NUM_PIXELS(NUM_PIXELS)
  ) dut (
      .clk(clk),
      .rst_n_in(rst_n_in),
      .pixel_mode(pixel_mode),
    //   .req_frame(req_frame),
      .source_sel(source_sel),
      .frame_data_out(frame_data_out),
      .counter_value_out(counter_value_out),
      .pixel_comparator_in(pixel_comparator_in),
      .column_out(column_out),
      .row_out(row_out),
      .source_sel_out(source_sel_out),
      .fpa_counter_signal(fpa_counter_signal),
      .fpa_out(fpa_out),
      .comparison(comparison),
      .fpa_wr_enable(fpa_wr_enable)
  );

  initial clk = 0;
  always #(CLK_PERIOD/2) clk = ~clk;

  task reset_dut();
    begin
      rst_n_in = 0;
      pixel_mode = 0;
      req_frame = 0;
      source_sel = 0;
      pixel_comparator_in = 0;
      repeat (5) @(posedge clk);
      rst_n_in = 1;
      @(posedge clk);
    end
  endtask

  initial begin
    $display("=== Starting Testbench at time %0t ===", $time);

    reset_dut();

    pixel_mode = 1'b1;
    source_sel = 1'b0;
    pixel_comparator_in = 1'b0;

    // wait the 3000-cycle latency for capture
    repeat (3004) @(posedge clk);
    @(posedge clk);

    // wait 2 cycles
    repeat (2) @(posedge clk);
    // send output to pooling unit over 1024 cycles
    for (int r = 0; r < NUM_PIXELS; r++) begin
      for (int c = 0; c < NUM_PIXELS; c++) begin
        @(posedge clk);
        fpa_out = test_value;
      end
    end

    
    // wait 2 cycles
    repeat (2) @(posedge clk);
    // send output to regfile over 1024 cycles
    for (int r = 0; r < NUM_PIXELS; r++) begin
      for (int c = 0; c < NUM_PIXELS; c++) begin
        @(posedge clk);
        fpa_out = test_value;
      end
    end
    // get output as read out over 1024 cycles
    index = 0;
    for (int r = 0; r < NUM_PIXELS; r++) begin
      for (int c = 0; c < NUM_PIXELS; c++) begin
        @(posedge clk);
        frame_mem[index] = frame_data_out;
        index++;
      end
    end

    // view errors
    errors = 0;
    for (int i = 0; i < FRAME_SIZE; i++) begin
      if (frame_mem[i] !== test_value) begin
        $display("ERROR: Pixel %0d mismatch: got %0d expected %0d",
                 i, frame_mem[i], test_value);
        errors++;
      end
    end

    if (errors == 0)
      $display("PASS: All %0d pixels correctly match output value %0d",
               FRAME_SIZE, test_value);
    else
      $display("FAIL: %0d errors detected", errors);

    $finish;
  end

endmodule