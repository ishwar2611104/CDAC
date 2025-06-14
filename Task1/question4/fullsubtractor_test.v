`timescale 1ns / 1ps

module test_fullsubtractor;

reg a, b, bin;
wire diff, bout;

fullsubtractor uut (
    .a(a),
    .b(b),
    .bin(bin),
    .diff(diff),
    .bout(bout)
);

initial begin
  
  

    // Dump waves
    $dumpfile("dump.vcd");
  $dumpvars(1, test_fullsubtractor);
  
    $display("a b bin | diff bout");
    $display("--------------------");

    a=0; b=0; bin=0; #10;
    $display("%b %b  %b  |  %b    %b", a, b, bin, diff, bout);

    a=0; b=0; bin=1; #10;
    $display("%b %b  %b  |  %b    %b", a, b, bin, diff, bout);

    a=0; b=1; bin=0; #10;
    $display("%b %b  %b  |  %b    %b", a, b, bin, diff, bout);

    a=0; b=1; bin=1; #10;
    $display("%b %b  %b  |  %b    %b", a, b, bin, diff, bout);

    a=1; b=0; bin=0; #10;
    $display("%b %b  %b  |  %b    %b", a, b, bin, diff, bout);

    a=1; b=0; bin=1; #10;
    $display("%b %b  %b  |  %b    %b", a, b, bin, diff, bout);

    a=1; b=1; bin=0; #10;
    $display("%b %b  %b  |  %b    %b", a, b, bin, diff, bout);

    a=1; b=1; bin=1; #10;
    $display("%b %b  %b  |  %b    %b", a, b, bin, diff, bout);

    $finish;
end

endmodule
