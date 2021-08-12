
module stopwatch_clock_top(
    input clk,
    input rst,

    input i_add_sec,
    input i_add_min,
    input i_add_hr,
    input i_Sw_Clk,
    input i_Start_Stop,
    input i_reset,

    output a, b, c, d, e, f, g,
    output [3:0] an

);

    wire [5:0] w_clk_min;
    wire [5:0] w_clk_hr;
    wire clk_2Hz;

    wire w_sec_ovf;
    wire w_min_ovf;

    wire [3:0] w_DD0_Ones;
    wire [3:0] w_DD0_Tens;

    wire [3:0] w_DD1_Ones;
    wire [3:0] w_DD1_Tens;

    wire w_Ovf_SW_Sec2Min;

    wire [5:0] w_Sec_SW;

    wire [5:0] w_Min_SW;

    wire [5:0] w_Mux_DD0;
    wire [5:0] w_Mux_DD1;

    assign clk_2Hz = clk;

    // clk_divider #(
    //     .FRECUENCY_IN(100_000_000),
    //     .FRECUENCY_OUT(2)
    // )CLK_1_SEC(
    //     .i_reset (rst),
    //     .i_clk   (clk),
    //
    //     .o_clk   (clk_2Hz)
    // );

    counter_clk_sec CLK_SEC(
        .clk(clk_2Hz),
        .rst(rst),

        .i_add(i_add_sec),

        .o_ovf(w_sec_ovf)
    );

    counter_clk_min CLK_MIN(
        .clk(clk_2Hz),
        .rst(rst),

        .i_ena(w_sec_ovf),
        .i_add(i_add_min),

        .o_count(w_clk_min),
        .o_ovf(w_min_ovf)
    );

    counter_clk_hr CLK_HR(
        .clk(clk_2Hz),
        .rst(rst),

        .i_ena(w_min_ovf),
        .i_add(i_add_hr),

        .o_count(w_clk_hr)
    );

    /* ---------- STOP WATCH ------------------------------------------------------------------------- */

    counter_sw_sec #(
        .LIMIT(60)
    )CNT_SW_SEC(
        .clk(clk_2Hz),
        .rst(rst),

        .i_reset(i_reset),
        .i_Sw_Clk(i_Sw_Clk),
        .i_Start_Stop(i_Start_Stop),

        .o_count(w_Sec_SW),
        .o_ovf(w_Ovf_SW_Sec2Min)
    );

    counter_sw_min #(
        .LIMIT(60)
    )CNT_SW_MIN(
        .clk(clk_2Hz),
        .rst(rst),

        .i_reset(i_reset),
        .i_Sw_Clk(i_Sw_Clk),
        .i_Start_Stop(i_Start_Stop),
        .i_ena(w_Ovf_SW_Sec2Min),

        .o_count(w_Min_SW),
        .o_ovf()
    );

        /* ---------- MUXES ---------------------------------------------------------------------------- */

    mux 		MUX_SEC_MIN
	 (
    	.i_slc(i_Sw_Clk),
    	.i_data1(w_Sec_SW),
		.i_data2(w_clk_min),

    	.o_out(w_Mux_DD0)
    );

    mux 		MUX_MIN_HR
	 (
        .i_slc(i_Sw_Clk),
        .i_data1(w_Min_SW),
		.i_data2(w_clk_hr),

        .o_out(w_Mux_DD1)
    );

   /* ---------- DOUBLE DABBLE -------------------------------------------------------------------- */

    double_dabble DD0(
        .i_Bin(w_Mux_DD0),

        .o_Tens(w_DD0_Tens),
        .o_Ones(w_DD0_Ones)
    );

    double_dabble DD1(
        .i_Bin(w_Mux_DD1),

        .o_Tens(w_DD1_Tens),
        .o_Ones(w_DD1_Ones)
    );

    /* ---------- 7 SEG ---------------------------------------------------------------------------- */

    muxed_display DISPLAY(
        .clk(clk),
        .rst(rst),

        .i_v0(w_DD0_Ones),
        .i_v1(w_DD0_Tens),
        .i_v2(w_DD1_Ones),
        .i_v3(w_DD1_Tens),

        .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g),
        .an(an)
     );


endmodule
