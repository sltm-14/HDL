`ifndef IF_UART_SV
    `define IF_UART_SV

import pkg_uart::*;

interface if_uart ();

logic		rcv;
data_t	data;

modport	rx
(
	output		rcv,
	output		data
);

modport	tx
(
	input			rcv,
	input			data
);


endinterface
	 
`endif
