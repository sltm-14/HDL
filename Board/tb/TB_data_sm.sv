`timescale 1ps / 1ps
`define SIMULATION

   localparam SPACE    = 4'b1010;  //10
   localparam ENTER    = 4'b1011;  //11
   localparam FORWARD  = 4'b1100;  //12
   localparam BACKWARD = 4'b1101;  //13
   localparam INVALID  = 4'b1110;  //14

module TB_data_sm();

localparam T = 2;

reg        TOP_Clk = 0;
reg        TOP_Rst;

reg        TOP_ena;
reg  [3:0] TOP_data_dec;

wire 	   TOP_led_ini;
wire [3:0] TOP_Motor_PWM_A;
wire [3:0] TOP_Motor_PWM_B;
wire [3:0] TOP_Motor_PWM_C;
wire [3:0] TOP_Motor_PWM_D;

TOP_data_sm  BOARD(
     .in_Clk (TOP_Clk),
     .in_Rst (TOP_Rst),

     .i_ena      (TOP_ena),
     .i_data_dec (TOP_data_dec),

     .out_led_ini     (TOP_led_ini),
     .out_Motor_PWM_A (TOP_Motor_PWM_A), /*Output for motor A*/ // [3:0]
     .out_Motor_PWM_B (TOP_Motor_PWM_B), /*Output for motor B*/ // [3:0]
     .out_Motor_PWM_C (TOP_Motor_PWM_C), /*Output for motor C*/ // [3:0]
     .out_Motor_PWM_D (TOP_Motor_PWM_D)  /*Output for motor D*/ // [3:0]
);

always begin
    TOP_Clk = 1'b1;
    #(T/2);

    TOP_Clk = 1'b0;
    #(T/2);
end

 initial begin
     TOP_Rst = 1;
     TOP_ena = 1'b1;
     #4;
     TOP_Rst = '0;

     /*---------------------- Motor 2 FORWARD 128° ---------------------*/

     TOP_data_dec  = 2;
     #4;
     TOP_ena = 1'b1;
     #4;
     TOP_ena = 1'b0;
     #8;

     TOP_data_dec  = SPACE;
     #4;
     TOP_ena = 1'b1;
     #2;
     TOP_ena = 1'b0;
     #8;

     TOP_data_dec  = FORWARD;
     #4;
     TOP_ena = 1'b1;
     #2;
     TOP_ena = 1'b0;
     #8;

     TOP_data_dec  = 1;
     #4;
     TOP_ena = 1'b1;
     #2;
     TOP_ena = 1'b0;
     #8;

     TOP_data_dec  = 2;
     #4;
     TOP_ena = 1'b1;
     #2;
     TOP_ena = 1'b0;
     #8;

     TOP_data_dec  = 8;
     #4;
     TOP_ena = 1'b1;
     #2;
     TOP_ena = 1'b0;
     #8;

     TOP_data_dec  = SPACE;
     #4;
     TOP_ena = 1'b1;
     #2;
     TOP_ena = 1'b0;
     #8;

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
