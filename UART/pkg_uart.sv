`ifndef PKG_UART_SV
    `define PKG_UART_SV
	 
package pkg_uart;

localparam  DW  		= 8;
localparam  DW1 		= DW + 1;

localparam BAUDRATE 	= (50000000/115200);

localparam BW  		= $clog2(BAUDRATE);
localparam BWH 		= (BAUDRATE >> 1);

typedef logic [3:0]     	count_t;
typedef logic [DW1+1:0] 	rcv_data_t;
typedef logic [DW-1:0]  	data_t;

typedef logic [DW1-1:0] 	data_tx_t;
typedef logic [DW1+2:0] 	trn_data_t;


typedef enum logic [2:0] {IDLE, RECV,  LOAD, PBIT,  READY} 	state_rx_t;	/* enum for states */
typedef enum logic [1:0] {IDLE_TX, START, TRANS}       		state_tx_t;	/* enum for states */
				 

typedef struct{
	logic       clk_baud;
	logic 		rx;
	count_t     count;
	logic       bauden;
	logic       clear;
	logic       load;
	logic       rcv;
	rcv_data_t  rcv_data;
	logic       pbit;
	logic       par_bit;
}st_uart_rx;

typedef struct{
	logic       clk_baud;
	count_t     count;
	logic       bauden;
	logic       load;
	trn_data_t  shifter;
	data_t      rcv_data;
	logic       start;
	logic       par_bit;
}st_uart_tx;


typedef struct{
	logic  		rcv;
	logic  		ready;
	data_t 		data;
}st_uart_top;

endpackage
`endif
