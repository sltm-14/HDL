module mux
(
	// Inputs
	input		i_slc,
	input [5:0] i_data1,
	input [5:0]	i_data2,

	// Output
	output[5:0]	o_out
);

	// Asignacion del dato elegido de acuerdo a la posicion del selector
	assign o_out = i_slc ? i_data1 : i_data2;

endmodule
