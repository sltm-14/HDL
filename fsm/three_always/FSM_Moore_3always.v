`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:35:02 10/30/2013 
// Design Name: 
// Module Name:    FSM_Moore_3always 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: Este módulo describe un contador ascendente/descendente binario, 
// 				controlador por las variables X[0], X[1], 
// 				siguiendo la siguiente tabla
// 				00 	Mantiene la cuenta
//					01		Cuenta ascendente
//					10		Cuenta descendente
//					11		Mantiene la cuenta.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FSM_Moore_3always(
    input [1:0] X, // Control ascendente o descendente
    input En,		// Enable de entrada
    input Rst,		// Reset asicrono
    input Clk,		// Señal de reloj
    output reg [1:0]Cuenta		// Valor de la cuenta.
    );
localparam 	S0=0, S1=1, S2=2,S3=3;		// Definición de los estado de la FSM.

reg [1:0]Edo_Actual;				
reg  [1:0]Edo_Siguiente;


always @ * // CTO combinacional del estado siguiente
begin
case(Edo_Actual)
S0:begin 
	if (X==1)
		Edo_Siguiente=S1; // Asciende en la cuenta
	else if (X==2)
		Edo_Siguiente=S3;	// Desciende en la cuenta.
	else 
		Edo_Siguiente=S0; // Hold Mantiene la cuenta igual
	end

S1:begin 
	if (X==1)
		Edo_Siguiente=S2; //Ascendente 
	else if (X==2)
		Edo_Siguiente=S0;	// Descendente
	else 
		Edo_Siguiente=S1;	// Hold
	end
S2:begin 
	if (X==1)
		Edo_Siguiente=S3;
	else if (X==2)
		Edo_Siguiente=S1;
	else 
		Edo_Siguiente=S2;
	end
S3:begin 
	if (X==1)
		Edo_Siguiente=S0;
	else if (X==2)
		Edo_Siguiente=S2;
	else 
		Edo_Siguiente=S3;
	end
default:Edo_Siguiente=0;
endcase

end


// FF -D Asyncrono (Cto secuencial de FSM)
always @(posedge Clk or negedge Rst)
begin
if (!Rst)		// Reset activo bajo
Edo_Actual<=0;
else if (En)	// Si esta habiliado el FF trabaja
Edo_Actual<=Edo_Siguiente; // Asignación non blocking
end


// CTO combinacional de salida.
always@*
begin
	Cuenta=Edo_Actual;
end

endmodule
