`timescale 1ns / 1ps

module DLatch_tb;

    reg d;
    reg en;
    wire q;

    // Instantiate the D Latch
    DLatch uut (
        .d(d),
        .en(en),
        .q(q)
    );

    initial begin
      

    // Dump waves
    $dumpfile("dump.vcd");
      $dumpvars(1, DLatch_tb);
        // Case 1: en = 0, d = 0 -> q should not change
        en = 0; d = 0;
        #10;
        $display("en = %b, d = %b, q = %b", en, d, q);

        // Case 2: en = 0, d = 1 -> q should not change
        en = 0; d = 1;
        #10;
        $display("en = %b, d = %b, q = %b", en, d, q);

        // Case 3: en = 1, d = 1 -> q should become 1
        en = 1; d = 1;
        #10;
        $display("en = %b, d = %b, q = %b", en, d, q);

        // Case 4: en = 1, d = 0 -> q should become 0
        en = 1; d = 0;
        #10;
        $display("en = %b, d = %b, q = %b", en, d, q);

        // Case 5: en = 0, d = 1 -> q should stay 0
        en = 0; d = 1;
        #10;
        $display("en = %b, d = %b, q = %b", en, d, q);

        // Done
        $finish;
    end

endmodule
