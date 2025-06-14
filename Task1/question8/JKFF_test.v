module JK_FF_Test;

    reg clk, j, k;
    wire q;

    JK_FF uut (.clk(clk), .j(j), .k(k), .q(q));

    initial begin
        clk = 0; forever #5 clk = ~clk; // 10ns clock period
    end

    initial begin
      

    // Dump waves
    $dumpfile("dump.vcd");
      $dumpvars(1, JK_FF_Test);
        j = 0; k = 0; #10;
        j = 1; k = 0; #10;
        j = 0; k = 1; #10;
        j = 1; k = 1; #10;
        j = 0; k = 0; #10;
        $finish;
    end

endmodule
