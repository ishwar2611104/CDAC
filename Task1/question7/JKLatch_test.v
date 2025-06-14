module JKLatch_tb;

    reg J, K, en;
    wire Q;

    JKLatch uut (.J(J), .K(K), .en(en), .Q(Q));

    initial begin
      

    // Dump waves
    $dumpfile("dump.vcd");
      $dumpvars(1, JKLatch_tb);
        en = 1;

        J=0; K=0; #10; $display("J=%b K=%b => Q=%b", J, K, Q); // Hold
        J=0; K=1; #10; $display("J=%b K=%b => Q=%b", J, K, Q); // Reset
        J=1; K=0; #10; $display("J=%b K=%b => Q=%b", J, K, Q); // Set
        J=1; K=1; #10; $display("J=%b K=%b => Q=%b", J, K, Q); // Toggle
        J=1; K=1; #10; $display("J=%b K=%b => Q=%b", J, K, Q); // Toggle again
        en = 0;
        J=0; K=1; #10; $display("J=%b K=%b => Q=%b", J, K, Q); // Should not change
        $finish;
    end
endmodule
