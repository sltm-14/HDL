module complement_a2(
	input  [7:0] i_Val, //Valor inicial en complemento a2

	output       o_Signo, //Signo de la entrada
	output [7:0] o_Val	  //Valor sin complemento
);

//El valor del septimo bit indica si el sign oes positivo o negativo, en caso de ser positivo se hace complemento A2
//de lo contrario el valor continua igual 
assign o_Val   = ( i_Val[7] ) ? ( (~i_Val) + 1'b1 ) : i_Val; 
assign o_Signo = ( i_Val[7] ) ? 1'b1 : 1'b0;

endmodule
