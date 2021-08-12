`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:11:59 11/10/2013
// Design Name:   FSM_Moore_3always
// Module Name:   /home/abisai/Dropbox/Office-Home/Iteso/HDL files/FSM/tb_FSM_3always.v
// Project Name:  FSM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FSM_Moore_3always
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_FSM_3always;

	// Inputs
	reg [1:0] X;
	reg En;
	reg Rst;
	reg Clk;

	// Outputs
	wire [1:0] Cuenta;

	// Instantiate the Unit Under Test (UUT)
	FSM_Moore_3always uut (
		.X(X), 
		.En(En), 
		.Rst(Rst), 
		.Clk(Clk), 
		.Cuenta(Cuenta)
	);

	initial begin
		// Initialize Inputs
		X = 0;
		En = 0;
		Rst = 0;
		Clk = 0;
		#2 Rst =1;	
			En=1;
		#10 X=0; 		// Señal de control está 	
		#10 X=1;			//5 ciclos de reloj en un valor de entrada y cambia el valor de control
		#10 X=2;
		#10 X=3;	
	end
	
	always
	begin
	#1 Clk <=~Clk;		// Señal de reloj
	end
      
endmodule

