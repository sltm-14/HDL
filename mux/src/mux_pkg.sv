// Coder:           DSc Abisai Ramirez Perez
// Date:            24 April 2019
// Name:            mux_pkg.sv
// Description:     This is the package of the parametric multiplexer.

`ifndef MUX_PKG_SV
    `define MUX_PKG_SV
package mux_pkg;

localparam  W_DW   = 6; // Data width of each input/output
localparam  N_SEL  = 2; // Selection bits

typedef logic [2**N_SEL-1:0][W_DW-1:0] in_bus_t;   // Incoming bus data to multiplexer
typedef logic [N_SEL-1:0]              selectr_t;  // Selector data type

typedef logic [W_DW-1:0]               dtwidth_t;  // Input / output data width

endpackage
`endif
