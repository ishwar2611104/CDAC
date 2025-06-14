`timescale 1ns / 1ps

module tb_mux13to1;

    // Inputs
    reg i0, i1, i2, i3, i4, i5, i6;
    reg i7, i8, i9, i10, i11, i12;
    reg [3:0] select;

    // Output
    wire y;

    // Instantiate the Unit Under Test (UUT)
    mux13to1 uut (
        .i0(i0), .i1(i1), .i2(i2), .i3(i3),
        .i4(i4), .i5(i5), .i6(i6), .i7(i7),
        .i8(i8), .i9(i9), .i10(i10), .i11(i11),
        .i12(i12), .select(select), .y(y)
    );

    initial begin
      
      

    // Dump waves
    $dumpfile("dump.vcd");
      $dumpvars(1, tb_mux13to1);
        $display("Testing 13:1 MUX");
        // Clear all
        {i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12} = 13'b0;
        select = 0;
        #10;

        i0 = 1; select = 0; #10;
        i0 = 0; i1 = 1; select = 1; #10;
        i1 = 0; i2 = 1; select = 2; #10;
        i2 = 0; i3 = 1; select = 3; #10;
        i3 = 0; i4 = 1; select = 4; #10;
        i4 = 0; i5 = 1; select = 5; #10;
        i5 = 0; i6 = 1; select = 6; #10;
        i6 = 0; i7 = 1; select = 7; #10;
        i7 = 0; i8 = 1; select = 8; #10;
        i8 = 0; i9 = 1; select = 9; #10;
        i9 = 0; i10 = 1; select = 10; #10;
        i10 = 0; i11 = 1; select = 11; #10;
        i11 = 0; i12 = 1; select = 12; #10;

        $finish;
    end
endmodule
