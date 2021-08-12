`timescale 1ns / 1ps

module tb_bin_to_dec;

logic [3:0] i_d;

logic o_b1;
logic o_b2;
logic o_b3;
logic o_b4;
logic o_b5;
logic o_b6;
logic o_b7;

logic clk;

dec_to_bin tb(
    .i_d(i_d),

    .o_b1(o_b1),
    .o_b2(o_b2),
    .o_b3(o_b3),
    .o_b4(o_b4),
    .o_b5(o_b5),
    .o_b6(o_b6),
    .o_b7(o_b7)
);

initial begin
      clk     = 0;
      i_d     = 0;
#10   i_d     = 7;
#10   i_d     = 3;
#10   i_d     = 2;
#10   i_d     = 5;
#50
$stop;
end

always begin
    #1 clk <= ~clk;
end


endmodule
