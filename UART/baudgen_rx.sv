 `ifndef BAUDGEN_RX_SV
    `define BAUDGEN_RX_SV

module baudgen_rx
import pkg_uart::*; 
#( 
  parameter BAUDRATE = (50000000/115200) 
)(
  input  rst,         
  input  clk,          

  input  clk_ena,      
         
  output clk_out      
);

  logic [BW-1:0] counter = 0;

  always @(posedge clk,negedge rst) begin

    if (!rst)
      counter <= 0;
    else if (clk_ena)
      counter <= (counter == BAUDRATE - 1) ? 0 : counter + 1;
    else
      counter <= BAUDRATE - 1;

  end

  assign clk_out = (counter == BWH) ? clk_ena : 0;

endmodule
`endif  