`timescale 1ns / 1ps

module UniShiftReg_tb;

    // Inputs
    reg clk;
    reg clr;
    reg serialright;
    reg serialleft;
    reg [3:0] in;
    reg [1:0] select;

    // Output
    wire [3:0] q;

    // Instantiate the Unit Under Test (UUT)
    UniShiftReg uut (
        .q(q),
        .serialright(serialright),
        .serialleft(serialleft),
        .in(in),
        .clk(clk),
        .clr(clr),
        .select(select)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
      

    // Dump waves
    $dumpfile("dump.vcd");
      $dumpvars(1, UniShiftReg_tb);
        // Initialize inputs
        clr = 1; serialright = 0; serialleft = 0; in = 4'b0000; select = 2'b00;
        #10 clr = 0;

        // Parallel Load
        in = 4'b1010; select = 2'b11; #10;

        // Hold
        select = 2'b00; #10;

        // Shift Right with serialright=1
        serialright = 1; select = 2'b01; #10;

        // Shift Left with serialleft=1
        serialleft = 1; select = 2'b10; #10;

        // Clear
        clr = 1; #10;
        clr = 0; #10;

        $finish;
    end

endmodule
