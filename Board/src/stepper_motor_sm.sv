`timescale 1ns / 1ps

module stepper_motor_sm(
    input clk,
    input rst,
    input dir,
    input en,
    input [9:0]i_Cycles,

    output reg [7:0] outA,
    output reg [7:0] outB,
    output reg [7:0] outC,
    output reg [7:0] outD
);

localparam one  = 1'b1;
localparam zero = 1'b0;

//typedef enum logic [2:0] {dis,en_AB,en_BC,en_CD,en_DA} state_t;

localparam dis   = 3'b000;
localparam en_AB = 3'b001;
localparam en_BC = 3'b011;
localparam en_CD = 3'b010;
localparam en_DA = 3'b110;


localparam dutyEnd   = 11'b11111111; //255
localparam dutyBegin =  8'b0111; //7

localparam cyclesPerStep  = 9'b100000000; //256
localparam stepSize = 8'b11111; //31

reg [9:0] dutyCycle_1;
reg [9:0] dutyCycle_2;


reg [2:0] presentState, nextState;
reg [18:0] stateCycles; //0-1020
reg [18:0] stepCycles;  //0-255

reg  changeState;

reg  [6:0] stateCounter;

reg  [9:0] r_cycles;

//********************************************** RESET ******************************************************

 always @ (posedge clk, posedge rst)begin
     presentState = (rst)? dis : nextState;
 end

//******************************************* STATE MACHINE ****************************************************


always @ (*) begin

    if (stateCounter <= r_cycles ) begin

      if ( changeState == 1'b1) begin

        case (presentState)

          en_AB: begin
            nextState = (dir)?  en_BC : en_DA;
          end

          en_BC: begin
            nextState = (dir)?  en_CD : en_AB;
          end

          en_CD: begin
            nextState = (dir)?  en_DA : en_BC;
          end

          en_DA: begin
            nextState = (dir)?  en_AB : en_CD;
          end

          dis: begin
            nextState = en_AB;
          end

        endcase



      end

      else begin
        nextState = presentState;
      end

      case(presentState)

        en_AB: begin
          if (dir == 1'b0)begin
            outA = dutyCycle_2;
            outB = dutyCycle_1;
            outC = 8'b00000000;
            outD = 8'b00000000;
          end

          else begin
            outA = dutyCycle_1;
            outB = dutyCycle_2;
            outC = 8'b00000000;
            outD = 8'b00000000;
          end


        end

        en_BC: begin
          if (dir == 1'b0)begin
            outA = 8'b00000000;
            outB = dutyCycle_2;
            outC = dutyCycle_1;
            outD = 8'b00000000;
          end

          else begin
            outA = 8'b00000000;
            outB = dutyCycle_1;
            outC = dutyCycle_2;
            outD = 8'b00000000;
          end


        end

        en_CD: begin
          if (dir == 1'b0)begin
            outA = 8'b00000000;
            outB = 8'b00000000;
            outC = dutyCycle_2;
            outD = dutyCycle_1;
          end

          else begin
            outA = 8'b00000000;
            outB = 8'b00000000;
            outC = dutyCycle_1;
            outD = dutyCycle_2;
          end


        end

        en_DA: begin
          if (dir == 1'b0)begin
            outA = dutyCycle_1;
            outB = 8'b00000000;
            outC = 8'b00000000;
            outD = dutyCycle_2;

          end

          else begin
            outA = dutyCycle_2;
            outB = 8'b00000000;
            outC = 8'b00000000;
            outD = dutyCycle_1;
          end

        end

        dis: begin
          outA = 8'b00000000;
          outB = 8'b00000000;
          outC = 8'b00000000;
          outD = 8'b00000000;
        end

     endcase

    end

    else begin
        outA = 8'b00000000;
        outB = 8'b00000000;
        outC = 8'b00000000;
        outD = 8'b00000000;
    end
end

//********************************************** STATES ******************************************************

always @(posedge clk, negedge rst) begin
    if(rst) begin
      stateCounter = 7'b0000000;
      changeState  = 1'b0;
      stepCycles   = 11'b00000000000;
      dutyCycle_1  = 11'b11111111;
      dutyCycle_2  = dutyBegin;
    end

    else if(en) begin
      stateCounter = 7'b0000000;
      changeState  = 1'b0;
      stepCycles   = 11'b00000000000;
      dutyCycle_1  = 11'b11111111;
      dutyCycle_2  = dutyBegin;
      r_cycles     = i_Cycles;
    end


    else begin
    if (stateCounter <= r_cycles ) begin
        changeState = 1'b0;
        stepCycles  = stepCycles + 1'b1;

        if (stepCycles == cyclesPerStep) begin

        stepCycles = 11'b00000000000;

               if (dutyCycle_1 ==  dutyBegin) begin
                  changeState = 1'b1;
                  dutyCycle_1 = dutyEnd ;
                  dutyCycle_2 = dutyBegin ;
                  stateCounter = stateCounter + 1'b1;
              end

              else begin
                  dutyCycle_1 = dutyCycle_1 - stepSize;
                  dutyCycle_2 = dutyCycle_2 + stepSize;

                  if(changeState == 1'b1) begin
                      changeState = 1'b0;
                  end

              end
         end
    end
   end

end

endmodule
