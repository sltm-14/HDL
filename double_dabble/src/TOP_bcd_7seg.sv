module TOP_bcd_7seg(
    input  [5:0] in_Bin,   //Valor inicial

    output [6:0] out_O,    //Salida Unidades
    output [6:0] out_T     //Salida Decenas
);

	wire [3:0] w_O;        //Cable para pasar las unidades
    wire [3:0] w_T;        //Cable para pasar las decenas

    // Modulo para obtener las unidades, decenas y centenas por separado
    bin_to_ot OT(
        .i_Bin(in_Bin),

        .o_Ones(w_O),
        .o_Tens(w_T)
     );

    // Modulo para mostrar las unidades en el display 7 segmentos
	bin_to_7seg B7S_O(
	   .A(w_O[3]), .B(w_O[2]), .C(w_O[1]), .D(w_O[0]),

	   .a(out_O[0]), .b(out_O[1]), .c(out_O[2]), .d(out_O[3]), .e(out_O[4]), .f(out_O[5]), .g(out_O[6])
	);

    // Modulo para mostrar las decenas en el display 7 segmentos
	bin_to_7seg B7S_T(
        .A(w_T[3]), .B(w_T[2]), .C(w_T[1]), .D(w_T[0]),

        .a(out_T[0]), .b(out_T[1]), .c(out_T[2]), .d(out_T[3]), .e(out_T[4]), .f(out_T[5]), .g(out_T[6])
     );



endmodule
