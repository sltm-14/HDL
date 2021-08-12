

module counter_sw_min
#(
	parameter [5:0] LIMIT  = 60,
	parameter [2:0] DW 	   = 6
)(

	input rst,
	input clk,
    
    input i_reset,
	input i_Sw_Clk,
	input i_Start_Stop,

	input i_ena,

	output  [DW-1'b1:0] o_count,
	output        o_ovf
);

	reg [DW-1'b1:0] r_count  = 6'b00_0000;
	reg          r_toogle    = 1'b1;

	always@(posedge clk, posedge rst) begin

		if(rst) begin
			r_count  <= 6'b00_0000;
			r_toogle <= 1'b1;
		end

		else if(!i_Start_Stop & !i_reset)begin
             r_count <= r_count;

        end

        else if (i_Sw_Clk & !i_reset)begin

           if(i_ena) begin
              if(r_count == (LIMIT-1'b1) ) begin
                 r_count  <= 6'b00_0000;
              end
              else if (r_toogle)begin
                 r_count  <= r_count + 1'b1;
              end
              else begin
                r_count  <=  r_count;
              end
            end

            else begin
                r_count  <=  r_count;
            end

             r_toogle <= ~r_toogle;
		end
		else begin
                r_count <= 6'b00_0000;
        end

	end

	assign o_count = r_count;
	assign o_ovf   = ( (r_count == (LIMIT-1'b1) ) & i_ena ) ? 1'b1 : 1'b0;

endmodule
