`timescale 1ns/1ps

module uart_rx_tb;

  // Clock and reset
  logic clk = 0;
  logic rst = 1;

  // UART RX line (idle high)
  logic rxd = 1'b1;

  // AXI-Stream interface
  logic [7:0] m_axis_tdata;
  logic       m_axis_tvalid;
  logic       m_axis_tready = 1'b1; // always ready

  // Status
  logic busy;
  logic overrun_error;
  logic frame_error;

  // Configuration
  logic [15:0] prescale = 16'd4; // small prescale for fast sim

  // DUT
// DUT instantiation
  `ifdef POST_SYN
      uart_rx dut (
          .clk(clk),
          .rst(rst),
          .m_axis_tdata(m_axis_tdata),
          .m_axis_tvalid(m_axis_tvalid),
          .m_axis_tready(m_axis_tready),
          .rxd(rxd),
          .busy(busy),
          .overrun_error(overrun_error),
          .frame_error(frame_error),
          .prescale(prescale)
      );
  `else
      uart_rx #(
          .DATA_WIDTH(8)
      ) dut (
          .clk(clk),
          .rst(rst),
          .m_axis_tdata(m_axis_tdata),
          .m_axis_tvalid(m_axis_tvalid),
          .m_axis_tready(m_axis_tready),
          .rxd(rxd),
          .busy(busy),
          .overrun_error(overrun_error),
          .frame_error(frame_error),
          .prescale(prescale)
      );
  `endif


  // 100 MHz clock
  always #5 clk = ~clk;

  // Send one UART frame (8N1), LSB first
  task automatic send_byte(input logic [7:0] data);
    int i;
    int bit_cycles;
    begin
      bit_cycles = prescale << 3; // matches DUT sampling

      // ensure line idle before start
      rxd = 1'b1;
      repeat (bit_cycles) @(posedge clk);

      // start bit (low)
      rxd = 1'b0;
      repeat (bit_cycles) @(posedge clk);

      // data bits LSB first
      for (i = 0; i < 8; i++) begin
        rxd = data[i];
        repeat (bit_cycles) @(posedge clk);
      end

      // stop bit (high)
      rxd = 1'b1;
      repeat (bit_cycles) @(posedge clk);
    end
  endtask

  // Monitor received bytes
  always @(posedge clk) begin
    if (m_axis_tvalid) begin
      $display("[%0t] RX: 0x%02h (busy=%0d overrun=%0d frame=%0d)", $time, m_axis_tdata, busy, overrun_error, frame_error);
    end
  end

  initial begin
    $dumpfile(`VCD_FILE);
    $dumpvars(0, uart_rx_tb);

    // reset
    repeat (5) @(posedge clk);
    rst = 0;

    // wait a bit, then send a byte
    repeat (10) @(posedge clk);
    send_byte(8'hA5);

    // small gap then another byte
    repeat (20) @(posedge clk);
    send_byte(8'h3C);

    // wait for reception to complete
    repeat (200) @(posedge clk);
    $display("Testbench completed at %0t", $time);
    $finish;
  end

endmodule
