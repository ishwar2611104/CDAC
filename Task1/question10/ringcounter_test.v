`timescale 1ns / 1ps

module ring_counter_tb;

    reg clk;
    reg reset;
    wire [3:0] q;

    ring_counter uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    initial begin
      

    // Dump waves
    $dumpfile("dump.vcd");
      $dumpvars(1, ring_counter_tb);
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        #10;
        reset = 0;

        // Run for 5 states
        #50;
        $finish;
    end

    always @(q) begin
        $display("Time = %0t | Output (Ring) = %b", $time, q);
    end

endmodule
