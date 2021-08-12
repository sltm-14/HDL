`timescale 1ns / 1ps

module data_state_machine(
    input            i_Clk,
    input            i_Rst,
    input            i_Enable,
    input      [3:0] i_Dec,
    
    output reg [3:0] o_units,
    output reg [3:0] o_tens,
    output reg [3:0] o_hundreds,
    output reg [2:0] o_motor,
    output reg       o_direction,
    output reg       o_motor_enable,
    output reg       o_led_ini
);

    typedef enum logic [3:0] {NON ,M1, ES1, S1, D1, D2, D3, ES_U, ES_T, ES_H, DONE, CLEAR, MSG_E} state_rx_t;
    
    state_rx_t present_state, next_state;
    
    
    localparam SPACE    = 4'b1010;  //10
    localparam ENTER    = 4'b1011;  //11
    localparam FORWARD  = 4'b1100;  //12
    localparam BACKWARD = 4'b1101;  //13
    localparam INVALID  = 4'b1110;  //14
    localparam ZERO     = 4'b0000;
    localparam TEN      = 4'b1010;
    localparam FIVE     = 4'b0101;
    localparam THREE    = 4'b0011;

    
    reg [3:0] r_units = '0;
    reg [3:0] r_tens  = '0;
    reg [3:0] r_hundreds  = '0;
    reg [2:0] r_motor     = '0;
    reg       r_direction = '0;

    always @ (posedge i_Clk, negedge i_Rst) begin
        present_state = (i_Rst)? M1 : next_state;
    end
    
    always @ (*) begin

        case(present_state)

            /*Se Obtiene el valor del motor que se desea mover*/

            M1: begin
                if( i_Enable ) begin
                    if ( (i_Dec > ZERO) && (i_Dec < FIVE) )begin
                        next_state = ES1;
                    end
                    else begin
                        next_state = MSG_E;
                    end
                end

                else begin
                    next_state = M1;
                end
            end  

            /* Se espera un espacio */

            ES1: begin
                if( i_Enable ) begin
                    if ( SPACE == i_Dec )begin
                        next_state = S1;
                    end
                    else begin
                        next_state = MSG_E;
                    end
                end

                else begin
                    next_state = ES1;
                end
            end 

            /* Se obtiene el signo que indica la direccion en qué ira el motor */

            S1: begin
                if( i_Enable ) begin
                    if ( (FORWARD == i_Dec) || (BACKWARD == i_Dec) )begin
                        next_state = D1;
                    end
                    else begin
                        next_state = MSG_E;
                    end
                end

                else begin
                    next_state = S1;
                end
            end

            D1: begin
                if( i_Enable ) begin
                    if ( (i_Dec >= ZERO ) && (i_Dec <  TEN) )begin
                        next_state = D2;
                    end
                    else begin
                        next_state = MSG_E;
                    end
                end

                else begin
                    next_state = D1;
                end
            end


            D2: begin
                if( i_Enable ) begin
                    if (  (i_Dec >= ZERO ) && (i_Dec <  TEN)  )begin
                        next_state = D3;
                    end
                    else if ( SPACE == i_Dec )begin
                        next_state = ES_U;
                    end
                    else begin
                        next_state = MSG_E;
                    end
                end

                else begin
                    next_state = D2;
                end
            end

            D3: begin
                if( i_Enable ) begin
                    if ( (i_Dec >= ZERO ) && (i_Dec <  TEN) && (r_hundreds >= ZERO ) && (r_hundreds <  THREE))begin
                        next_state = ES_H;
                    end
                    else if ( SPACE == i_Dec )begin
                        next_state = ES_T;
                    end
                    else begin
                         next_state = MSG_E;
                    end
                 end
            

                else begin
                    next_state = D3;
                end
            end

            ES_U: begin
                next_state = DONE;
            end
            
            ES_T: begin
                next_state = DONE;
            end

            ES_H: begin
                if( i_Enable ) begin
                    if (SPACE == i_Dec )begin
                        next_state = DONE;
                    end
                    else begin
                         next_state = MSG_E;
                    end
                 end

                else begin
                    next_state = ES_H;
                end
            end 

            DONE: begin
                next_state = CLEAR;
            end 

            CLEAR: begin
                next_state = M1;
            end

            MSG_E:begin
                next_state = CLEAR;
            end

            default: begin
                next_state = M1; 
            end

        endcase
    end 
            
    always @ (posedge i_Clk, negedge i_Rst) begin
        if (i_Rst)begin
            o_units        = '0;
            o_tens         = '0;
            o_hundreds     = '0;
            o_motor        = '0;
            o_direction    = '0;
            o_motor_enable = '0;
            o_led_ini      = '0;
        end
        else if (present_state == M1) begin
            r_motor        = i_Dec;
            o_led_ini      = 1'b1;
            o_motor_enable = 1'b0;
        end
        else if (present_state == ES1) begin
            o_led_ini = 1'b0;
        end
        else if (present_state == S1) begin
            r_direction = i_Dec;
        end
        else if (present_state == D1) begin
            r_hundreds = i_Dec;
        end
        else if (present_state == D2) begin
            r_tens = i_Dec;
        end
        else if (present_state == D3) begin
            r_units = i_Dec;
        end
        else if (present_state == ES_U) begin
            r_units    = r_hundreds;
            r_tens     = 4'b0000;;
            r_hundreds = 4'b0000;
        end

        else if (present_state == ES_T) begin
            r_units    = r_tens;
            r_tens     = r_hundreds;
            r_hundreds = 4'b0000;
        end
        else if (present_state == ES_H) begin
             r_units    = r_units;
             r_tens     = r_tens;
             r_hundreds = r_hundreds;
        end
        else if (present_state == DONE) begin
            o_motor        = r_motor;
            o_units        = r_units;
            o_tens         = r_tens;
            o_hundreds     = r_hundreds;
            o_direction    = r_direction;
            o_motor_enable = 1'b1;
        end
        else if (present_state == CLEAR || present_state == MSG_E) begin
            r_units     = 4'b0000;
            r_tens      = 4'b0000;
            r_hundreds  = 4'b0000;
            r_motor     = 3'b000;
            r_direction = 1'b0;
        end
        else begin            
            r_units    = 4'b0000;
            r_tens     = 4'b0000;
            r_hundreds = 4'b0000;
        end
    end


endmodule

