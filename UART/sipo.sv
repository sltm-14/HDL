 `ifndef SIPO_SV
    `define SIPO_SV

module sipo 
import pkg_uart::*;
#(	
	parameter SDW   = 10  )
 (
	input            clk,
	input            rst,

	input            i_ena,
	input            i_val,

	output logic [SDW-1:0]    o_val
);

	logic [SDW-1:0]  r_rgstr;

	always_ff@(posedge clk, negedge rst) begin
	    if(!rst)
	        r_rgstr  <= '0;
	    else if (i_ena)
	        r_rgstr  <= {i_val, r_rgstr[SDW-1:1]};
	end

	assign o_val  = r_rgstr;

endmodule
 `endif  