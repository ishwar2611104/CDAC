`timescale 1ns / 1ps

module fourtonetest;

    // Inputs
    reg i0, i1, i2, i3;
    reg [1:0] select;

    // Output
    wire y;

    // Instantiate the Unit Under Test (UUT)
    mux uut (
        .i0(i0), 
        .i1(i1), 
        .i2(i2), 
        .i3(i3), 
        .select(select), 
        .y(y)
    );

    initial begin
    // Dump waves
    $dumpfile("dump.vcd");
      $dumpvars(1, 4:1_test);
      
        // Test all select combinations
        i0 = 1; i1 = 0; i2 = 0; i3 = 0; select = 2'b00; #10;
        i0 = 0; i1 = 1; i2 = 0; i3 = 0; select = 2'b01; #10;
        i0 = 0; i1 = 0; i2 = 1; i3 = 0; select = 2'b10; #10;
        i0 = 0; i1 = 0; i2 = 0; i3 = 1; select = 2'b11; #10;

        $finish;
    end
endmodule
