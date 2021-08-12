`timescale 1ns / 1ps
module tb_ALU;
	integer id_AHandle;
	integer id_BHandle;
	integer id_SELHandle;
	integer id_Outputs;
	integer id_Monitor;
	integer statusA;
	integer statusB;
	integer statusSEL;
	integer statusOut;

	// Inputs
	reg [3:0] A_i;
	reg [3:0] B_i;
	reg [2:0] opSel;
	reg [7:0] ExpectedOutput;
	reg referenceClk;

	// Outputs
	wire [7:0] R_alu;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.A_i  (A_i),
		.B_i  (B_i),
		.opSel(opSel),

		.r_alu(R_alu)
	);

	initial begin
		// Open files
		id_AHandle   = $fopen("../sw/InputsA.txt","r");
		id_BHandle   = $fopen("../sw/InputsB.txt","r");
		id_SELHandle = $fopen("../sw/InputsSEL.txt","r");
		id_Outputs   = $fopen("../sw/ExpectedOutputs.txt","r");
		id_Monitor   = $fopen("../sw/Report.txt","w");
	end

	initial begin
		// Initialize Inputs
		A_i = 0;
		B_i = 0;
		opSel = 0;
		referenceClk = 0;

		repeat(2048)
			begin
				@(posedge referenceClk)
				statusA = $fscanf(id_AHandle,"%d \n",A_i);
				statusB = $fscanf(id_BHandle,"%d \n",B_i);
				statusSEL = $fscanf(id_SELHandle,"%d \n",opSel);
			end
		$fclose(id_AHandle);
		$fclose(id_BHandle);
		$fclose(id_SELHandle);
	end

initial
begin
	repeat(2048)
	begin
			@(negedge referenceClk)
			statusOut = $fscanf(id_Outputs,"%d \n",ExpectedOutput);
			$fwrite(id_Monitor,"%h %h\n",ExpectedOutput,R_alu);
			if (R_alu  !== ExpectedOutput) begin
			 $display("%0dns Error : input and output does not match",$time);
			 $display("       Got  %h",R_alu);
			 $display("       Exp  %h",ExpectedOutput);
			end
			else begin
			$display("%0dns Match",$time);
			$display("       Got  %h",R_alu);
			$display("       Exp  %h",ExpectedOutput);
			end

	end
	$fclose(id_Outputs);
	$fclose(id_Monitor);
end

always
begin
#1 referenceClk <= (~referenceClk);
end

endmodule
