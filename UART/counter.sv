 `ifndef COUNTER_SV
    `define COUNTER_SV

module counter 
import pkg_uart::*;
(
	input clk,
	input rst,

	input i_clear,
	input i_ena,

	output count_t o_count
);

	logic [3:0] r_count;

	always @(posedge clk,negedge rst) begin
		if (!rst)
			r_count <= '0;
		else if (i_clear)
		    r_count <= '0;
		else if (i_ena )
		    r_count <= r_count + 1;
		else 
			r_count <= r_count;
	end

	assign o_count = r_count;

endmodule
`endif  