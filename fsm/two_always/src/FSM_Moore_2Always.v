`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:35:02 10/30/2013 
// Design Name: 
// Module Name:    FSM_Moore_2always 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: Este módulo describe un contador ascendente/descendente binario, 
// 				controlado por las variables X[0], X[1], siguiendo la siguiente 
//					tabla
// 				00 	Mantiene la cuenta
//					01		Cuenta ascendente
//					10		Cuenta descendente
//					11		Mantiene la cuenta.
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FSM_Moore_2always(
    input [1:0] X,
    input En,
    input Rst,
    input Clk,
    output reg [1:0]Cuenta
    );
localparam 	S0=0, S1=1, S2=2,S3=3;

reg [1:0]Edo_Actual;	
//reg  [1:0]Edo_Siguiente;


always @ (posedge Clk or negedge Rst) // Circuito Secuenicial en un proceso always.
if (!Rst)
Edo_Actual<=0;
else if (En)
begin
case(Edo_Actual)
S0:begin 
	if (X==1)
		Edo_Actual<=S1; // Asciende en la cuenta
	else if (X==2)
		Edo_Actual<=S3;	// Desciende en la cuenta.
	else 
		Edo_Actual<=S0; // Hold
	end

S1:begin 
	if (X==1)
		Edo_Actual<=S2;
	else if (X==2)
		Edo_Actual<=S0;
	else 
		Edo_Actual<=S1;
	end
S2:begin 
	if (X==1)
		Edo_Actual<=S3;
	else if (X==2)
		Edo_Actual<=S1;
	else 
		Edo_Actual<=S2;
	end
S3:begin 
	if (X==1)
		Edo_Actual<=S0;
	else if (X==2)
		Edo_Actual<=S2;
	else 
		Edo_Actual<=S3;
	end
default:Edo_Actual<=0;
endcase

end


//// FF -D Asyncroni (Cto secuencial de FSM)
//always @(posedge Clk or negedge Rst)
//begin
//if (!Rst)
//Edo_Actual<=0;
//else if (En)
//Edo_Actual<=Edo_Siguiente;
////else
////Edo_Actual<=Edo_Actual;
//end


// CTO combinacional de salida.

always@*
begin
	Cuenta=Edo_Actual;
end

endmodule
