module baudgen_rx #( parameter BAUDRATE = (125000000/115200) )(
         input wire rstn,
         input wire clk,
         input wire clk_ena,

         output wire clk_out
);

localparam N  = $clog2(BAUDRATE);
localparam M2 = (BAUDRATE >> 1);

reg [N-1:0] divcounter = 0;

always @(posedge clk, negedge rstn)

  if (!rstn)
    divcounter <= 0;

  else if (clk_ena)
    divcounter <= (divcounter == BAUDRATE - 1) ? 0 : divcounter + 1;
  else

    divcounter <= BAUDRATE - 1;


assign clk_out = (divcounter == M2) ? clk_ena : 0;


endmodule
