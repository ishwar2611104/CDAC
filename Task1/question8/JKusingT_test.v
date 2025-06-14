module JK_using_T_tb;
    reg J, K, clk, reset;
    wire q;

    JK_using_T uut (.J(J), .K(K), .clk(clk), .reset(reset), .q(q));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
      

    // Dump waves
    $dumpfile("dump.vcd");
      $dumpvars(1, JK_using_T_tb);
        reset = 1; J = 0; K = 0; #10;
        reset = 0;

        J = 1; K = 0; #10;
        J = 0; K = 1; #10;
        J = 1; K = 1; #10;
        J = 0; K = 0; #10;
        $finish;
    end
endmodule
