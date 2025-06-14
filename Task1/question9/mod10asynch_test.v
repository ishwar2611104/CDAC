`timescale 1ns / 1ps

module mod10asychctr_tb;

    // Inputs
    reg clk;
    reg reset;

    // Outputs
    wire [3:0] q;

    // Instantiate the Unit Under Test (UUT)
    mod10asychctr uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    // Clock generation: toggles every 5 ns
    initial clk = 0;
    always #5 clk = ~clk;

    // Stimulus
    initial begin
      

    // Dump waves
    $dumpfile("dump.vcd");
      $dumpvars(1, mod10asychctr_tb);
        // Start with reset enabled
        reset = 1;
        #10;

        // Deactivate reset
        reset = 0;

        // Let the counter run for a while
        #200;

        // Apply reset again
        reset = 1;
        #10;
        reset = 0;

        // Run more
        #100;

        $finish;
    end

    // Display output
    always @(q)
        $display("Time = %0t | Counter = %b", $time, q);

endmodule
