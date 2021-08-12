`ifndef UART_RX_SV
    `define UART_RX_SV

module uart_rx
import pkg_uart::*;
#( parameter BAUDRATE = (50000000/115200))(
         input        	clk,
         input        	rst,

         input      	rx,

         output        	error,
		if_uart.rx		rx_if
);

st_uart_rx wires;

register #(1) REG_RX(
    .clk	    (clk),
    .rst	    (rst),

    .i_val  	(rx),

    .o_val  	(wires.rx)
);


baudgen_rx #(BAUDRATE) BAUDGEN_RX (
    .rst	    (rst),
    .clk	    (clk),

    .clk_ena    (wires.bauden),

    .clk_out	(wires.clk_baud)
);


counter COUNT(
    .clk		(clk),
    .rst		(rst),

    .i_clear	(wires.clear),
    .i_ena		(wires.clk_baud),

    .o_count	(wires.count)
);


sipo #(11) SIPO_DATA(
    .clk		(clk),
    .rst		(rst),

    .i_ena		(wires.clk_baud),
    .i_val		(wires.rx),

    .o_val      (wires.rcv_data)
);


register_en #(8)  REG_DATA(
    .clk						(clk),
    .rst						(rst),

    .i_val					(wires.rcv_data[9:2]),
    .i_ena					(wires.load),

    .o_val					(rx_if.data)
);

parity_bit_gen PARBIT_GEN(
    .data					(wires.rcv_data[9:2]),

    .parity_bit			(wires.par_bit)
);

parity_error BIT_ERROR(
    .i_ena					(wires.pbit),
    .i_bit_rcv				(wires.rcv_data[9]),
    .i_bit_gen				(wires.par_bit),

    .o_bit_error			(error)
);


control_rx CONTROL(
    .clk						(clk),
    .rst						(rst),

    .i_rx					(wires.rx),
    .i_count				(wires.count),

    .o_bauden				(wires.bauden),
    .o_clear				(wires.clear),
    .o_load					(wires.load),
    .o_pbit					(wires.pbit),
    .o_rcv					(rx_if.rcv)
);

endmodule
`endif
