`timescale 1ns / 1ps

module stepper_motor(
    input       in_clk,
    input       in_rst,
    input       in_dir,
    input       in_en,
    input [9:0] in_cycles,
    
    output [3:0] out_PWM
    
);

    parameter bits_pwm	= 8;

    wire       CycleStart0;
    wire       CycleStart1;
    wire       CycleStart2;
    wire       CycleStart3;
    
    wire [7:0] w_duty_cycle_0;
    wire [7:0] w_duty_cycle_1;
    wire [7:0] w_duty_cycle_2;
    wire [7:0] w_duty_cycle_3;

    stepper_motor_sm MOTOR_SM( 
             .clk      (in_clk),
             .rst      (in_rst),
             .dir      (in_dir),
             .en       (in_en),
             .i_Cycles (in_cycles),
                       
             .outA (w_duty_cycle_0),
             .outB (w_duty_cycle_1),
             .outC (w_duty_cycle_2),
             .outD (w_duty_cycle_3)
     );
    
    pwm  #(.TOTAL_BITS(bits_pwm), .POL(0))
             PWM_0    
            (.iClk (in_clk), 
             .iCE  (1'b1), 
             .iRst (in_rst),
             .ivDutyCycle(w_duty_cycle_0),
             
             .oPWM (out_PWM[0]),
             .oCycleStart(CycleStart0));
             
    pwm  #(.TOTAL_BITS(bits_pwm), .POL(0))
             PWM_1    
            (.iClk(in_clk), 
             .iCE(1'b1), 
             .iRst(in_rst),
             .ivDutyCycle(w_duty_cycle_1),
             
             .oPWM(out_PWM[1]),
             .oCycleStart(CycleStart1));
             
    pwm  #(.TOTAL_BITS(bits_pwm), .POL(0))
              PWM_2    
             (.iClk(in_clk), 
              .iCE(1'b1), 
              .iRst(in_rst),
              .ivDutyCycle(w_duty_cycle_2),
              
              .oPWM(out_PWM[2]),
              .oCycleStart(CycleStart2));
              
     pwm  #(.TOTAL_BITS(bits_pwm), .POL(0))
              PWM_3    
              (.iClk(in_clk), 
               .iCE(1'b1), 
               .iRst(in_rst),
               .ivDutyCycle(w_duty_cycle_3),
               
               .oPWM(out_PWM[3]),
               .oCycleStart(CycleStart3));
    
endmodule
