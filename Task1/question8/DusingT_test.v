module D_using_T_tb;
    reg D, clk, reset;
    wire q;

    D_using_T uut (.D(D), .clk(clk), .reset(reset), .q(q));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
      

    // Dump waves
    $dumpfile("dump.vcd");
      $dumpvars(1, D_using_T_tb);
        reset = 1; D = 0; #10;
        reset = 0;

        D = 1; #10;
        D = 0; #10;
        D = 1; #10;
        D = 1; #10;
        $finish;
    end
endmodule
