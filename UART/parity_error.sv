 `ifndef PARITY_ERROR_SV
    `define PARITY_ERROR_SV

module parity_error
import pkg_uart::*; 
(
	input  i_ena,
	input  i_bit_rcv,
	input  i_bit_gen,

	output o_bit_error
);
	
	assign o_bit_error = ( i_bit_rcv == i_bit_gen )? 0 : 1;
	

endmodule
`endif