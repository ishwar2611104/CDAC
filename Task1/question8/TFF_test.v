module Tff_Test;

    reg clk, t, reset;
    wire qt, qtbar;

    Tff uut (
        .t(t),
        .reset(reset),
        .clk(clk),
        .qt(qt),
        .qtbar(qtbar)
    );

    // Clock generator
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock period
    end

    // Stimulus
    initial begin
      

    // Dump waves
    $dumpfile("dump.vcd");
      $dumpvars(1, Tff_Test);
        t = 0; reset = 1;
        #10;  // Reset active
        reset = 0;

        t = 1; #10;
        t = 1; #10;
        t = 0; #10;
        t = 1; #10;
        reset = 1; #10; // Reset again
        reset = 0; #10;

        $finish;
    end

endmodule
