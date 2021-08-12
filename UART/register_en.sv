`ifndef REGISTER_EN_SV
    `define REGISTER_EN_SV

module register_en 
import pkg_uart::*;
#(	
	parameter SDW   = 32  )
 (
	input 			 clk,
	input 			 rst,

	input  [SDW-1:0] i_val,
	input            i_ena,

	output logic [SDW-1:0] o_val
);


always_ff @(posedge clk, negedge rst) begin
	if(!rst) 
		o_val <= '0;

	else if (i_ena)
		o_val <= i_val;

end

endmodule
`endif