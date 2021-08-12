`timescale 1ns / 1ps

module degrees_to_cycles(
	// input         in_Clk,
    // input         in_Rst,
    input  [8:0]  in_Degrees,

    output [9:0] out_Cycles
);

    wire [12:0] w_val;

    multiplier MLT(
//        .i_Clk(in_Clk),
//        .i_Rst(in_Rst),
        .i_Val1(in_Degrees),
        .i_Val2(5'b01010),

        .o_Result(w_val)
    );

    divider DVR(
//        .i_Clk(in_Clk),
//        .i_Rst(in_Rst),
        .i_Divisor(5'b1_0010),
        .i_Dividendo(w_val),

        .o_Result(out_Cycles)
    );


endmodule
