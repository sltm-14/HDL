
module counter_clk_hr
#(
	parameter LIMIT  = 24,
	parameter DW     = 6
)(
	input clk,
	input rst,

	input i_add,
	input i_ena,

	output  [DW-1:0] o_count
);

	reg [DW-1:0] r_count  =6'b00_0000;
	reg          r_toogle = 1'b1;

	always@(posedge clk, posedge rst) begin

		if(rst) begin
			r_count  <= 6'b00_0000;
			r_toogle <= 1'b1;
		end

		else begin
            if (i_add) begin
              if(r_count == (LIMIT - 1'b1) ) begin
                 r_count  <= 6'b00_0000;
              end
              else begin
                 r_count  <= r_count + 1'b1;
              end
            end

            else if(i_ena  & r_toogle) begin
              if(r_count == (LIMIT - 1'b1) ) begin
                 r_count  <= 1'b0;
              end
              else begin
                 r_count  <= r_count + 1'b1;
              end
            end

            else begin
                r_count  <=  r_count;
            end

             r_toogle <= ~r_toogle;
		end


	end

	assign o_count = r_count;

endmodule
