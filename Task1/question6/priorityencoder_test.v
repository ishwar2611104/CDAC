`timescale 1ns / 1ps

module tb_priorityEncoder;

    reg i0, i1, i2, i3;
    wire [1:0] y;

    // Instantiate the Unit Under Test (UUT)
    priorityEncoder uut (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .y(y)
    );

    integer input_vector;

    initial begin
      

    // Dump waves
    $dumpfile("dump.vcd");
      $dumpvars(1, tb_priorityEncoder);
        $display(" i3 i2 i1 i0 | y");
        $display("--------------");

        for (input_vector = 0; input_vector < 16; input_vector = input_vector + 1) begin
            {i3, i2, i1, i0} = input_vector[3:0];
            #5; // allow time for y to update
            $display("  %b  %b  %b  %b | %b", i3, i2, i1, i0, y);
        end

        $finish;
    end

endmodule
