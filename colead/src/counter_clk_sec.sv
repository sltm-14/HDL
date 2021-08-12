module counter_clk_sec
#(
	parameter [5:0] LIMIT  = 60,
	parameter [2:0] DW 	   = 6
)(
	input clk,
	input rst,

	input i_add,

	output o_ovf
);

	reg [DW-1'b1:0] r_count	 = 6'b00_0000;
	reg		  		r_ovf	 = 1'b0;
	reg       		r_toogle = 1'b0;

	always@(posedge clk or posedge rst) begin

        if(rst) begin
            r_count  <= 6'b00_0000;
            r_ovf    <= 1'b0;
            r_toogle <= 1'b0;
        end

        else begin

            if(i_add || !r_toogle)begin
                if(r_count == (LIMIT-1'b1)) begin
                    r_count <= 6'b00_0000;
                    r_ovf   <= 0;
                end
                else begin
                    r_count <= r_count + 1'b1;
                    r_ovf   <= 1'b0;
                end
            end

            else if (r_toogle && r_count == (LIMIT-1'b1))begin
                r_count <= r_count;
                r_ovf   <= 1'b1;
            end

            else begin
                r_count <= r_count;
                r_ovf   <= 1'b0;
            end

            r_toogle <= ~r_toogle;
			
        end
	end

	assign o_ovf   = r_ovf;

endmodule
