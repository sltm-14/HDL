module TB_bcd_7seg;

    logic clk;

    logic [5:0] in_Bin;   //Valor inicial

    logic [6:0] out_O;    //Salida Unidades (Display)
    logic [6:0] out_T;     //Salida Decenas  (Display)

    TOP_bcd_7seg BCD_TO_7SEG(
        .in_Bin(in_Bin),   //Valor inicial

        .out_O(out_O),    //Salida Unidades (Display)
        .out_T(out_T)     //Salida Decenas  (Display)
    );

    always begin
        #1 clk <= ~clk;
    end

	initial begin
	    in_Bin = 23;    #5;
	    in_Bin = 41;    #5;

	    in_Bin = 00;    #5;
	    in_Bin = 59;    #5;

	end

endmodule
