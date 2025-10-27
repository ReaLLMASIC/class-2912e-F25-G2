
`timescale 1ns/1ps

module testbench();

    reg clk;
    reg reset;
    reg [9:0] wr_addr;
    reg [9:0] rd_addr1;
    reg [9:0] rd_addr2;
    reg wr_enable;
    reg rd_enable;
    reg [7:0] in;
    wire [7:0] out1;
    wire [7:0] out2;


    regfile regfile(
        .clk(clk),
        .reset(reset),
        .wr_addr(wr_addr),
        .rd_addr1(rd_addr1),
        .rd_addr2(rd_addr2),
        .wr_enable(wr_enable),
        .rd_enable(rd_enable),
        .in(in),
        .out1(out1), 
        .out2(out2)
    );

    integer read_file;
    integer write_file;
    integer scan_file;
    integer handle;
    reg [256*8:1] file_line;

    reg [15:0] temp;

    parameter clk_period = 1000;
    integer return_value;

    initial begin
	$sdf_annotate("../syn/results/reg.syn.sdf", regfile);
    // use the macro defined dump vcd filename
    $dumpfile(`VCD_FILE);
	$dumpvars( 0, testbench); 

    clk = 1'b0;
    reset = 1'b1;
    in = 8'd0;
    wr_enable = 1'b0;
    rd_enable = 1'b0;

    wr_addr = 10'b1111111111;
    rd_addr1 = 10'b1111111111;
    rd_addr2 = 10'b1111111111;

    #clk_period reset = 1'b0;

    read_file = $fopen("/foss/designs/class-2912e-F25-G2/flow/designs/src/regfile/tb/goldenbrick/goldenbrick.txt", "r");
	if (read_file == 0) begin
        $display("Can not open file goldenbrick.txt");
        $finish;
    end

    write_file = $fopen(`VSIM_OUT, "w");
	if (write_file == 0) begin
        $display("Can not write in file rtl_sim_output.txt");
        $finish;
    end

    handle = $fopen(`VSIM_OUT, "w");
    end       

    
    always @(negedge clk) begin
        #1;
        if (!reset) begin
            file_line = "";
            void'($fgets(file_line, read_file));
            $sscanf(file_line, "WR = %b RD = %b WRADDR = %b RD1 = %b RD2 = %b DATA = %b", wr_enable, rd_enable, wr_addr, rd_addr1, rd_addr2, in);
            #1;

            if ($feof(read_file)) begin
                $fclose(read_file);
                $fclose(write_file);
                $fclose(handle);
                $finish;
            end
            
            $fdisplay(handle, "WR = %b RD = %b WRADDR = %b RD1 = %b RD2 = %b DATA = %b OUT1 = %b OUT2 = %b", wr_enable, rd_enable, wr_addr, rd_addr1, rd_addr2, in, out1, out2);

        end
    end 

    always #(clk_period/2) clk = ~clk;

endmodule
