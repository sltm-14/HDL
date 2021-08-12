`ifndef ADD_CONDITION_SV
    `define ADD_CONDITION_SV
	 
module add_condition(
    input  [13:0] i_hto, //Entra el valor de centenas, decenas y unidades

    output [13:0] o_hto  //Sale el nuevo valor de centenas, decenas y unidades
);

    //Si el valor actual es mayor a 4, se le suman 3, si no el valor pasa igual
    assign o_hto[13:10] = ( i_hto[13:10] > 4'b0100 ) ? ( i_hto[13:10] + 2'b11 ) : i_hto[13:10];
    assign o_hto[9:6]   = ( i_hto[9:6]   > 4'b0100 ) ? ( i_hto[9:6]  + 2'b11 ) : i_hto[9:6];

    //Los primeros 6 bits permanecen igual
    assign o_hto[5:0] = i_hto[5:0];

endmodule
`endif