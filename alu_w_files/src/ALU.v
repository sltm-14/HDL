module ALU(
    input signed [3:0] A_i,
    input signed [3:0] B_i,
    input        [2:0] opSel,

    output  [7:0] o_alu
    );

    wire [3:0] r_and;
    wire [3:0] r_or;
    wire [3:0] r_not;
    wire [3:0] r_xor;

    wire signed [3:0] r_suma;
    wire signed [3:0] r_resta;
    wire signed [3:0] r_minus;
    wire signed [7:0] r_mult;

    reg [7:0] r_alu;

    assign r_and = A_i & B_i;
    assign r_or  = A_i | B_i;
    assign r_not = ~B_i;
    assign r_xor = A_i ^ B_i;

    assign r_suma  = A_i + B_i;
    assign r_resta = A_i - B_i;
    assign r_minus = A_i * -1;
    assign r_mult  = A_i * B_i;

    always@(*)
    begin
    	case(opSel)
    		0: r_alu = {4'b0, r_and};
    		1: r_alu = {4'b0, r_or};
    		2: r_alu = {4'b0, r_not};
    		3: r_alu = {4'b0, r_xor};
    		4: r_alu = {{4{r_suma[3]}}, r_suma};
    		5: r_alu = {{4{r_resta[3]}}, r_resta};
    		6: r_alu = {{4{r_minus[3]}}, r_minus};
    		7: r_alu = r_mult;
    		default r_alu = 0;
    	endcase
    end

    assign o_alu = r_alu;

endmodule
