`ifndef CONTROL_RX_SV
    `define CONTROL_RX_SV

module control_rx
import pkg_uart::*;
(
  input clk,
  input rst,

  input i_rx,
  input count_t i_count,

  output o_bauden,
  output o_clear,
  output o_load,
  output o_pbit,
  output o_rcv
);

logic bauden = '0;
logic clear  = '0;
logic load   = '0;
logic rcv    = '0;
logic pbit   = '0;

state_rx_t state = IDLE;

always @(posedge clk, negedge rst) begin

    if (~rst)
        state <= IDLE;
    else

    case(state)

       IDLE: begin
          if (i_rx == 0)
            state <= RECV;
        end

        RECV: begin
          if (i_count == 4'd10)
            state <= LOAD;
        end

        LOAD: begin
          state <= PBIT;
        end

        PBIT: begin
          state <= READY;
        end

        READY: begin
          state <= IDLE;
        end

        default: begin
          state <= IDLE;
        end

    endcase

end

always @(*) begin
    case(state)

       IDLE: begin
          rcv    = 0;
          pbit   = 0;
          load   = 0;
          clear  = 1;
          bauden = 0;
        end

        RECV: begin
          rcv    = 0;
          pbit   = 0;
          load   = 0;
          clear  = 0;
          bauden = 1;
        end

        LOAD: begin
          rcv    = 0;
          pbit   = 0;
          load   = 1;
          clear  = 0;
          bauden = 0;
        end

        PBIT: begin
          rcv    = 0;
          pbit   = 1;
          load   = 0;
          clear  = 0;
          bauden = 0;
        end


        READY: begin
          rcv    = 1;
          pbit   = 0;
          load   = 0;
          clear  = 0;
          bauden = 0;
        end

        default: begin
          rcv    = 0;
          pbit   = 0;
          load   = 0;
          clear  = 0;
          bauden = 0;
        end

    endcase
end

   assign o_bauden = bauden;
   assign o_clear  = clear;
   assign o_load   = load;
   assign o_pbit   = pbit;
   assign o_rcv    = rcv;

endmodule
 `endif
