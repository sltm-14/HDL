 `ifndef BAUDGEN_TX_SV
    `define BAUDGEN_TX_SV

module baudgen_tx
import pkg_uart::*; 
#( 
  parameter BAUDRATE = (50000000/115200) 
)(
  input   rst,      
  input   clk,        
  input   clk_ena,    

  output  clk_out           
);

reg [BW-1:0] counter = 0;

always @(posedge clk) begin
  if (!rst)
    counter <= 0;

  else if (clk_ena)
    counter <= (counter == BAUDRATE - 1) ? 0 : counter + 1;

  else
    counter <= BAUDRATE - 1;
end 

assign clk_out = (counter == 0) ? clk_ena : 0;


endmodule
`endif  