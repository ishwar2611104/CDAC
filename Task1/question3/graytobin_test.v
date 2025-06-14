`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Engineer: 
// Testbench for: graytobinconvques4
//////////////////////////////////////////////////////////////////////////////////

module testgraytobin;

    // Inputs
    reg [3:0] g;

    // Outputs
    wire [3:0] b;

    // Instantiate the Unit Under Test (UUT)
    graytobinconvques4 uut (
        .g(g), 
        .b(b)
    );

    // Expected binary calculation for comparison
    function [3:0] expected_binary;
        input [3:0] gray;
        begin
            expected_binary[3] = gray[3];
            expected_binary[2] = gray[3] ^ gray[2];
            expected_binary[1] = gray[3] ^ gray[2] ^ gray[1];
            expected_binary[0] = gray[3] ^ gray[2] ^ gray[1] ^ gray[0];
        end
    endfunction

    initial begin
      

    // Dump waves
    $dumpfile("dump.vcd");
      $dumpvars(1, testgraytobin);
      
        g = 4'b0000;
        #100;  // Wait for global reset

        // Iterate over all 4-bit Gray codes
        repeat (16) begin
            #10;
            $display("Input (gray): %04b | Output (bin): %04b | Expected: %04b", g, b, expected_binary(g));
            g = g + 1;
        end

        $finish;
    end

endmodule
