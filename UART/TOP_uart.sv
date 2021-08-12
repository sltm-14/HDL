`ifndef TOP_UART_SV
    `define TOP_UART_SV

module TOP_uart
import pkg_uart::*;
#(
    parameter BAUDRATE = (50_000_000/115200)
)(
    input  clk,
    input  rstn,
    input  rx,

    output tx,
    output error
);

st_uart_top wires;
if_uart	top_if();

uart_rx #(.BAUDRATE(BAUDRATE)) RX (
    .clk(clk),
    .rst(rstn),
    .rx(rx),

	.rx_if(top_if),
    .error(error)
);

uart_tx #(.BAUDRATE(BAUDRATE)) TX (
    .clk(clk),
    .rst(rstn),

	.tx_if(top_if),
    .tx(tx),
    .ready(wires.ready)
);

endmodule
`endif
