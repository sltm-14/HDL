`timescale 1ps / 1ps
`define SIMULATION

   localparam SPACE    = 4'b1010;  //10
   localparam ENTER    = 4'b1011;  //11
   localparam FORWARD  = 4'b1100;  //12
   localparam BACKWARD = 4'b1101;  //13
   localparam INVALID  = 4'b1110;  //14

module tb_stpm_full();

localparam T = 2;

logic        i_Clk;
logic        i_Rst;

logic        i_Dir;
logic  [3:0] i_En;
logic  [9:0] i_Cycles;

logic [3:0] o_Pwm_a;
logic [3:0] o_Pwm_b;
logic [3:0] o_Pwm_c;
logic [3:0] o_Pwm_d;

stpm_full  BOARD(
    .i_Clk(i_Clk),
    .i_Rst(i_Rst),

    .i_Dir(i_Dir),
    .i_En(i_En),
    .i_Cycles(i_Cycles),

    .o_Pwm_a(o_Pwm_a),
    .o_Pwm_b(o_Pwm_b),
    .o_Pwm_c(o_Pwm_c),
    .o_Pwm_d(o_Pwm_d)
);

always begin
    #1 i_Clk = ~i_Clk;
end

 initial begin
     i_Rst    = 1;
     i_Clk    = 0;

     i_Dir    = '0;
     i_En     = 4'b1111;

     i_Cycles = '0;
     #100;
     // i_En     = 4'b0000;
     // #100;
     i_Cycles = 71;
     // i_En     = 4'b0001;
     #10;
     i_Rst    = '0;

     /*---------------------- Motor 2 FORWARD 128° ---------------------*/

     #100;

     i_Dir    = '0;
     // i_En     = 4'b0001;
     i_Cycles = 71;
     #10
     i_En     = 4'b1110;
     
     #100_000;

     i_Cycles = 100;
     i_Dir    = 1;

     #1000;

     i_En     = 4'b0000;

     /*---------------------- Motor 1 BACKWARD 87° ---------------------*/

     // TOP_data_dec  = 1;
     // #4;
     // TOP_ena = 1'b1;
     // #2;
     // TOP_ena = 1'b0;
     // #8;
     //
     // TOP_data_dec  = SPACE;
     // #4;
     // TOP_ena = 1'b1;
     // #2;
     // TOP_ena = 1'b0;
     // #8;
     //
     // TOP_data_dec  = BACKWARD;
     // #4;
     // TOP_ena = 1'b1;
     // #2;
     // TOP_ena = 1'b0;
     // #8;
     //
     // TOP_data_dec  = 8;
     // #4;
     // TOP_ena = 1'b1;
     // #2;
     // TOP_ena = 1'b0;
     // #8;
     //
     // TOP_data_dec  = 7;
     // #4;
     // TOP_ena = 1'b1;
     // #2;
     // TOP_ena = 1'b0;
     // #8;
     //
     //
     // TOP_data_dec  = ENTER;
     // #4;
     // TOP_ena = 1'b1;
     // #2;
     // TOP_ena = 1'b0;
     // #8;

     // /*---------------------- Motor 3 BACKWARD 210° ---------------------*/
     //
     // TOP_data_dec  = 3;
     // #4;
     // TOP_ena = 1'b1;
     // #2;
     // TOP_ena = 1'b0;
     // #8;
     //
     // TOP_data_dec  = SPACE;
     // #4;
     // TOP_ena = 1'b1;
     // #2;
     // TOP_ena = 1'b0;
     // #8;
     //
     // TOP_data_dec  = BACKWARD;
     // #4;
     // TOP_ena = 1'b1;
     // #2;
     // TOP_ena = 1'b0;
     // #8;
     //
     // TOP_data_dec  = 2;
     // #4;
     // TOP_ena = 1'b1;
     // #2;
     // TOP_ena = 1'b0;
     // #8;
     //
     // TOP_data_dec  = 1;
     // #4;
     // TOP_ena = 1'b1;
     // #2;
     // TOP_ena = 1'b0;
     // #8;
     //
     // TOP_data_dec  = 0;
     // #4;
     // TOP_ena = 1'b1;
     // #2;
     // TOP_ena = 1'b0;
     // #8;
     //
     // TOP_data_dec  = ENTER;
     // #4;
     // TOP_ena = 1'b1;
     // #2;
     // TOP_ena = 1'b0;
     // #8;
     //
     //       /*---------------------- Motor 4 FORWARD 7° ---------------------*/
     //
     // TOP_data_dec  = 4;
     // #4;
     // TOP_ena = 1'b1;
     // #2;
     // TOP_ena = 1'b0;
     // #8;
     //
     // TOP_data_dec  = SPACE;
     // #4;
     // TOP_ena = 1'b1;
     // #2;
     // TOP_ena = 1'b0;
     // #8;
     //
     // TOP_data_dec  = FORWARD;
     // #4;
     // TOP_ena = 1'b1;
     // #2;
     // TOP_ena = 1'b0;
     // #8;
     //
     // TOP_data_dec  = 7;
     // #4;
     // TOP_ena = 1'b1;
     // #2;
     // TOP_ena = 1'b0;
     // #8;
     //
     // TOP_data_dec  = ENTER;
     // #4;
     // TOP_ena = 1'b1;
     // #2;
     // TOP_ena = 1'b0;
     // #8;

 end

endmodule
