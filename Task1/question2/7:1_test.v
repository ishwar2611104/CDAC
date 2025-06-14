`timescale 1ns / 1ps

module tb_mux7to1;

    // Inputs
    reg i0, i1, i2, i3, i4, i5, i6;
    reg [2:0] select;

    // Output
    wire y;

    // Instantiate the Unit Under Test (UUT)
    mux7to1 uut (
        .i0(i0), .i1(i1), .i2(i2), .i3(i3),
        .i4(i4), .i5(i5), .i6(i6),
        .select(select), .y(y)
    );

    initial begin
      
      

    // Dump waves
    $dumpfile("dump.vcd");
      $dumpvars(1, tb_mux7to1);
        $display("Testing 7:1 MUX");
        // Clear all
        i0 = 0; i1 = 0; i2 = 0; i3 = 0;
        i4 = 0; i5 = 0; i6 = 0; select = 0;
        #10;

        i0 = 1; select = 0; #10;
        i0 = 0; i1 = 1; select = 1; #10;
        i1 = 0; i2 = 1; select = 2; #10;
        i2 = 0; i3 = 1; select = 3; #10;
        i3 = 0; i4 = 1; select = 4; #10;
        i4 = 0; i5 = 1; select = 5; #10;
        i5 = 0; i6 = 1; select = 6; #10;

        $finish;
    end
endmodule
