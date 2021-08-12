`timescale 1ns / 1ps

module tb_dec_to_bin;

logic i_d1;
logic i_d2;
logic i_d3;
logic i_d4;
logic i_d5;
logic i_d6;
logic i_d7;

logic [3:0] o_b;

logic clk;

dec_to_bin tb(
    .i_d1(i_d1),
    .i_d2(i_d2),
    .i_d3(i_d3),
    .i_d4(i_d4),
    .i_d5(i_d5),
    .i_d6(i_d6),
    .i_d7(i_d7),

    .o_b(o_b)
);

initial begin
     clk     = 0;
     i_d1    = 0;
     i_d2    = 0;
     i_d3    = 0;
     i_d4    = 0;
     i_d5    = 0;
     i_d6    = 0;
     i_d7    = 0;
#5   i_d1    = 1;
#5   i_d1    = 0;
#5   i_d5    = 1;
#5   i_d5    = 0;
#5   i_d7    = 1;
#5   i_d3    = 1;
#50
$stop;
end

always begin
    #1 clk <= ~clk;
end


endmodule
