`timescale 1ns / 1ps
module tb2_ALU;

	// Inputs
	reg [3:0] A_i;
	reg [3:0] B_i;
	reg [2:0] opSel;

	// Outputs
	wire [7:0] o_alu;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.A_i(A_i),
		.B_i(B_i),
		.opSel(opSel),

		.o_alu(o_alu)
	);

	initial begin
		// Initialize Inputs
		A_i = 0;
		B_i = 0;
		opSel = 0;
	end

	always
	begin
	#1 {opSel, B_i, A_i} <= {opSel, B_i, A_i} + 1'b1;
	end

endmodule
