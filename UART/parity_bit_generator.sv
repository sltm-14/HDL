 `ifndef PARITY_BIT_GEN_SV
    `define PARITY_BIT_GEN_SV

module parity_bit_gen
import pkg_uart::*; 
(
	input data_t 	data,

	output      	parity_bit
);
	
	assign parity_bit = data[0] ^ data[1] ^ data[2]^ data[3] ^ data[4]^ data[5]^ data[6] ^ data[7];
	

endmodule
`endif