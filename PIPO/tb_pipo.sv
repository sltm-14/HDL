`timescale 1ns / 1ps
module tb_pipo;

logic           clk;
logic           rst;
logic           enb;
logic [3:0]     i_data;
logic [3:0]     o_data;


pipo uut(
.clk       (clk       ),
.rst       (rst       ),
.enb       (enb       ),
.i_data    (i_data    ),
.o_data    (o_data    )
);

initial begin
            rst     = 0;
            clk     = 0;
            enb     = 0;
            inp     = 0;
            rst     = 1;
    #10.2   rst     = 0;
    #4.2    rst     = 1;
    #5      enb     = 1;
    #5      i_data  = $urandom%16;
    #5      i_data  = $urandom%16;
    #5      i_data  = $urandom%16;
    #3      i_data  = $urandom%16;
    #6      i_data  = $urandom%16;
    #6      i_data  = $urandom%16;
    #6      i_data  = $urandom%16;
    #6      i_data  = $urandom%16;
    #100
    $stop;
end

always begin
    #1 clk <= ~clk;
end

endmodule

