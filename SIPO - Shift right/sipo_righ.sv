module sipo_right #(
parameter DW = 4
) (
input               clk,
input               rst,
input               enb,
input               inp,
output  [DW-1:0]    out
);

logic [DW-1:0]      rgstr_r;

always_ff@(posedge clk or negedge rst) begin: rgstr_label
    if(!rst)
        rgstr_r  <= '0;
    else if (enb)
        rgstr_r  <= {inp,rgstr_r[DW-1:1]};
end:rgstr_label

assign out  = rgstr_r;

//TODO: try to design a SIPO register where the serial input is connected to the MSB bit and shifting is to the right
endmodule
