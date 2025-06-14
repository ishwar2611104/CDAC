`timescale 1ns / 1ps

module TLatchTest;

    // Inputs
    reg t;
    reg en;
    reg reset;

    // Output
    wire q;

    // Instantiate the Unit Under Test (UUT)
    TLatch uut (
        .t(t), 
        .en(en), 
        .reset(reset), 
        .q(q)
    );

    initial begin
      

    // Dump waves
    $dumpfile("dump.vcd");
      $dumpvars(1, TLatchTest);
        // Initial values
        t = 0;
        en = 0;
        reset = 0;

        // Apply a reset pulse to set q = 0
        #5;
        reset = 1;
        #10;
        reset = 0;

        // Enable the latch
        en = 1;

        // Toggle with T = 1
        t = 1;
        #20;

        // Hold T = 1 again
        t = 1;
        #20;

        // Disable latch (en = 0), q should hold
        en = 0;
        #20;

        // Change T to 0, still disabled, q should stay same
        t = 0;
        #20;

        // End simulation
        $finish;
    end

endmodule
