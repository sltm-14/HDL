module stpm_full(
        input        i_Clk,
        input        i_Rst,
        input        i_Dir,
        input  [3:0] i_En,
        input  [9:0] i_Cycles,

        output [3:0] o_Pwm_a,
        output [3:0] o_Pwm_b,
        output [3:0] o_Pwm_c,
        output [3:0] o_Pwm_d

    );

        stepper_motor STPM_0(
            .in_clk(i_Clk),
            .in_rst(i_Rst),
            .in_dir(i_Dir),
            .in_en(i_En[0]),
            .in_cycles(i_Cycles),

            .out_PWM(o_Pwm_a)
        );

        stepper_motor STPM_1(
            .in_clk(i_Clk),
            .in_rst(i_Rst),
            .in_dir(i_Dir),
            .in_en(i_En[1]),
            .in_cycles(i_Cycles),

            .out_PWM(o_Pwm_b)
        );

        stepper_motor STPM_2(
            .in_clk(i_Clk),
            .in_rst(i_Rst),
            .in_dir(i_Dir),
            .in_en(i_En[2]),
            .in_cycles(i_Cycles),

            .out_PWM(o_Pwm_c)
        );

        stepper_motor STPM_3(
            .in_clk(i_Clk),
            .in_rst(i_Rst),
            .in_dir(i_Dir),
            .in_en(i_En[3]),
            .in_cycles(i_Cycles),

            .out_PWM(o_Pwm_d)
        );


endmodule
