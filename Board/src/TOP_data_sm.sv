
module TOP_data_sm #(parameter BAUDRATE = (125000000/115200))(
      input  in_Clk,
      input  in_Rst,

      input       i_ena,      // Simulacion
      input [3:0] i_data_dec, // Simulacion

//      input       in_Rx,  /* UART Rx*/ // Tarjeta

//      output      out_Tx, /*Tx output, shows content in terminal*/  // Tarjeta

      output       out_led_ini,

      output [3:0] out_Motor_PWM_A, /*Output for motor A*/
      output [3:0] out_Motor_PWM_B, /*Output for motor B*/
      output [3:0] out_Motor_PWM_C, /*Output for motor C*/
      output [3:0] out_Motor_PWM_D  /*Output for motor D*/
);

    wire [3:0] w_units;
    wire [3:0] w_tens;
    wire [3:0] w_hundreds;
    wire [2:0] w_motor;
    wire       w_direction;
    //wire       w_done;
    wire [8:0] w_degrees;

//    wire       w_Freq_Clk; // Tarjeta

    wire [3:0] w_motor_dmx;
    wire [3:0] w_motorSync;
    wire       w_motor_enable;

    wire [9:0] w_cycles;

//    wire w_Clk_M;  // Tarjeta
 /*  --------------------- Tarjeta ---------------------- */

     //  wire       w_Rcv;
     //  wire [7:0] w_Data_Ascii;
     //  wire [3:0] w_Data_Dec;
     //
     //
     //  /*UART data reseption*/
     // uart_rx #( .BAUDRATE(BAUDRATE) ) RX(
     //     .clk(in_Clk),
     //     .rstn(~in_Rst),
     //     .rx(in_Rx),
     //
     //     .rcv(w_Rcv),
     //     .data(w_Data_Ascii)
     //  );
     //
     //  /*UART data transmition*/
     //  uart_tx #(.BAUDRATE(BAUDRATE))TX(
     //     .clk(in_Clk),
     //     .rstn(~in_Rst),
     //     .start(w_Rcv),
     //     .data(w_Data_Ascii),
     //
     //     .tx(out_Tx),
     //     .ready()
     //  );
     //
     //  /*Data converter, date received from UART is in ASCII, this module converts data to decimal*/
     //  ascii_to_dec AtD(
     //      .i_Ascii(w_Data_Ascii),
     //
     //      .o_Dec(w_Data_Dec)
     //  );

/* ---------------------------------------------------------- */

    /*State machine to revceive data from uart, this state machine checks if the information
    is received in the right order to manipulate the motors*/
    data_state_machine DSM(
        .i_Clk(in_Clk),
        .i_Rst(in_Rst),

        .i_Enable ( i_ena      ), // Simulacion
        .i_Dec    ( i_data_dec ), // Simulacion

       // .i_Enable ( w_Rcv ),      // Tarjeta
       // .i_Dec    ( w_Data_Dec ), // Tarjeta


        .o_units(w_units),
        .o_tens(w_tens),
        .o_hundreds(w_hundreds),
        .o_direction(w_direction),
        .o_motor(w_motor),
        .o_motor_enable(w_motor_enable),
        .o_led_ini(out_led_ini)
    );

    /*Motor demultiplexer, after receiving the informtion from uart,
    this demultiplexer decides wich motor is goint to me enabled*/
    motor_dmx DMX(
        .i_Clk(in_Clk),

        .i_motor(w_motor),
        .i_Rst(in_Rst),
        .i_enable(w_motor_enable),

        .o_motor(w_motor_dmx)
    );

   /*Signals get synchronized so they can get recognized by 10khz clk*/
     motor_sync_full SYNC_FULL(
        .i_Clk(in_Clk),
        .i_Rst(in_Rst),
        .i_Signals(w_motor_dmx),

        .o_SyncSignals(w_motorSync)
    );

    /*Data from ones, tens and hundreds is converted to its complete value,
    example: From          To
                  1
                  20
                  100        121    */
    uth_converter UTH(
        .i_clk(in_Clk),
        .i_rst(in_Rst),
        .i_units(w_units),
        .i_tens(w_tens),
        .i_hundreds(w_hundreds),

        .o_degrees(w_degrees)
    );

    /*converts data from degrees to the number of cycles that the motor needs to rotate*/
    degrees_to_cycles DtC(
        .in_Degrees(w_degrees),

        .out_Cycles(w_cycles)
    );


    // clk_wiz_0 clock_0 (
    //     .clk_in1(in_Clk),
    //     .reset  (0'b0),
    //     .locked (locked),
    //
    //     .clk_out1(w_Clk_M)
    //  );
    //
    // /*Freq div*/
    // clk_divider CLK_DIV(
    //     .i_rst(in_Rst),
    //     .i_clk(w_Clk_M),
    //
    //     .o_clk(w_Freq_Clk)
    // );


    /*Conections for all motors*/
    stpm_full STPM_FULL(
        .i_Clk (in_Clk ),  // Simulacion
//        .i_Clk (  w_Freq_Clk ),    // Tarjeta
        .i_Rst (in_Rst),

        .i_Dir (w_direction),
        .i_En  (w_motorSync),
        .i_Cycles(w_cycles),

        .o_Pwm_a(out_Motor_PWM_A),
        .o_Pwm_b(out_Motor_PWM_B),
        .o_Pwm_c(out_Motor_PWM_C),
        .o_Pwm_d(out_Motor_PWM_D)

     );


endmodule
