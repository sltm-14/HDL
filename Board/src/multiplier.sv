`timescale 1ns / 1ps

module multiplier(
//	input         i_Clk,
//	input         i_Rst,
	input  [8:0]  i_Val1,
    input  [4:0]  i_Val2,

    output reg [12:0] o_Result
);

localparam [3:0] VAL1_SIZE = 4'b1001;
localparam [2:0] VAL2_SIZE = 3'b101;
localparam [8:0] ZEROS     = 9'b000000000;

reg [13:0]   r_Val1;
reg [4:0]    r_Val2;
reg [12:0]   r_Result;

reg [2:0]   r_MCount = 3'b000;

always @ (*)begin

//    if ( i_Rst ) begin
//    	r_Val1   = 0;
//        r_Val2   = 0;
//        r_Result = 0;
//    end

    r_Val1 = i_Val1;
	r_Val2 = i_Val2;
	r_Result = 0;

	for ( r_MCount = 3'b000 ; r_MCount < VAL2_SIZE ; r_MCount = r_MCount + 1'b1 ) begin

		if ( r_Val2[r_MCount] )begin
			r_Result = r_Result + r_Val1;
		end
			
		else begin 
		    r_Result = r_Result + ZEROS;
		end

		r_Val1 = r_Val1 << 1;
		
	end

	o_Result = r_Result;

end

endmodule  