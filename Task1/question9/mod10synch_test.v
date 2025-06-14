`timescale 1ns / 1ps

module syncMod10_tb;

    // Inputs
    reg clk;
    reg reset;

    // Outputs
    wire [3:0] q;

    // Instantiate the Unit Under Test (UUT)
    syncMod10 uut (
        .clk(clk), 
        .reset(reset), 
        .q(q)
    );

    // Clock generation: toggles every 5 ns (10 ns period)
    initial clk = 0;
    always #5 clk = ~clk;

    // Stimulus
    initial begin
      

    // Dump waves
    $dumpfile("dump.vcd");
      $dumpvars(1, syncMod10_tb);
        // Start with reset
        reset = 1;
        #10;
        reset = 0;

        // Run counter
        #200;

        // Apply reset again
        reset = 1;
        #10;
        reset = 0;

        // Run more
        #100;

        $finish;
    end

    // Print output when q changes
    always @(q)
        $display("Time = %0t | Counter = %d", $time, q);

endmodule
