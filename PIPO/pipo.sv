module pipo #(
	parameter DW = 4
	)(
	input               clk,
	input               rst,
	input               enb,
	input  [DW-1:0]     i_data,

	output [DW-1:0]     o_data
	);

	logic [DW-1:0]      r_rgstr;

	always_ff@(posedge clk or negedge rst) begin: register
	    if(!rst)
	        r_rgstr  <= '0;
	    else if (enb)
	        r_rgstr  <= i_data;
	end:register

	assign o_data  = r_rgstr;

endmodule
