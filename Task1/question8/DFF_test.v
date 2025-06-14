module D_FF_Test;

    reg clk, d;
    wire q;

    D_FF uut (.clk(clk), .d(d), .q(q));

    initial begin
        clk = 0; forever #5 clk = ~clk;
    end

    initial begin
      

    // Dump waves
    $dumpfile("dump.vcd");
      $dumpvars(1, D_FF_Test);
        d = 0; #10;
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
        $finish;
    end

endmodule
