`timescale 1ns / 1ps

module testbintog;

	// Inputs
	reg [3:0] b;

	// Outputs
	wire [3:0] g;

	// Instantiate the Unit Under Test (UUT)
	bintgrayconvques3 uut (
		.b(b), 
		.g(g)
	);

	integer i;
	initial begin
      
      

    // Dump waves
    $dumpfile("dump.vcd");
      $dumpvars(1, testbintog);
		// Wait for global reset
		#10;
		
		// Apply all 16 input values
		for (i = 0; i < 16; i = i + 1) begin
			b = i;
			#5; // wait for propagation
			$display("Input (bin): %04b | Output (gray): %04b | Expected: %04b", 
				b, g, {b[3], b[3]^b[2], b[2]^b[1], b[1]^b[0]});
		end
		
		$finish;
	end

endmodule
