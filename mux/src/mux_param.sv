// Coder:           DSc Abisai Ramirez Perez
// Date:            24 April 2019
// Name:            mux_param.sv
// Description:     This is a parametric multiplexer

`ifndef MUX_PARAM_SV
    `define MUX_PARAM_SV

    module mux_param
        import mux_pkg::*;
        (
        input   in_bus_t    datain,     // Incoming data bus
        input   selectr_t   select,     // Selector

        output  dtwidth_t   sltd_o      // Selected data
        );

        assign sltd_o = datain[select];

    endmodule

`endif
