`timescale 1ns / 1ps

module tb_mux_param;

import mux_pkg::*;

in_bus_t    datain;
selectr_t   select;
dtwidth_t   sltd_o;

mux_param uut(
.datain(datain),     // Incoming data bus
.select(select),     // Selector
.sltd_o(sltd_o)      // Selected data
);

initial begin
        datain  = $random();
        select  = 0;
    #2  select  = 1;
    #2  select  = 2;
    #2  select  = 3;
    #2  datain = $random();
        select  = 0;
    #2  select  = 1;
    #2  select  = 2;
    #2  select  = 3;
    #100
    $stop;
end

endmodule
