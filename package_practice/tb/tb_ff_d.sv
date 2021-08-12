`timescale 1ns / 1ps

    module tb_ff_d;
    import ff_d_pkg::*;

    bit clk;
    logic rst;
    t_dw i_data;

    t_dw o_data;

    ff_d flip_flop(
        .clk (clk),
        .rst (rst),
        .i_data (i_data),

        .o_data (o_data)
    );


    always begin
        #1 clk <= ~clk;
    end

    initial begin
            rst    = 0;
            i_data = 0;
        #5  rst    = 1;
        #5  i_data = 10;
        #15

        $stop;

    end

    endmodule
