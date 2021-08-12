`ifndef CONTROL_TX_SV
    `define CONTROL_TX_SV
 
module control_tx 
import pkg_uart::*;
(
  input clk,    
  input rst, 

  input         i_start, 
  input count_t i_count,
  
  output o_start,
  output o_bauden,
  output o_load,
  output o_ready
);


logic bauden = '0;  
logic load   = '0;   
logic ready  = '0;   


state_tx_t state = IDLE_TX;


always @(posedge clk, negedge rst) begin

    if (!rst)
        state <= IDLE_TX;
    else

    case(state)

        IDLE_TX: begin
          if (i_start)
            state <= START;
        end

        START: begin
            state <= TRANS;
        end

        TRANS: begin
          if (i_count == 4'b1100)
            state <= IDLE_TX;
        end

        default: begin
          state <= IDLE_TX;
        end 

    endcase

end

always @(*) begin
    case(state)

       IDLE_TX: begin
          ready  = 1;
          load   = 0;
          bauden = 0;
        end

        START: begin
          ready  = 0;
          load   = 1;
          bauden = 1;
        end
        
        TRANS: begin
          ready  = 0;
          load   = 0;
          bauden = 1;
        end

        default: begin
          ready  = 0;
          load   = 0;
          bauden = 0;
        end 

    endcase
end

   assign o_bauden = bauden;
   assign o_load   = load;
   assign o_ready  = ready;
   assign o_start  = i_start;

endmodule
`endif  