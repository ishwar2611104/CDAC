module SR_FF_Test;

    reg clk, s, r;
    wire q;

    SR_FF uut (.clk(clk), .s(s), .r(r), .q(q));

    initial begin
        clk = 0; forever #5 clk = ~clk;
    end

    initial begin
      

    // Dump waves
    $dumpfile("dump.vcd");
      $dumpvars(1, SR_FF_Test);
        s = 0; r = 0; #10;
        s = 1; r = 0; #10;
        s = 0; r = 1; #10;
        s = 1; r = 1; #10;
        s = 0; r = 0; #10;
        $finish;
    end

endmodule
