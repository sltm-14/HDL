`ifndef FF_D_SV
    `define FF_D_SV

    module ff_d
    import ff_d_pkg::*;
    (
        input clk,
        input rst,

        input  t_dw i_data,

        output t_dw o_data
    );

        t_dw r_data;

        always_ff@(posedge clk, negedge rst)begin
            if(!rst)begin
                r_data <= '0;
            end
            else begin
                r_data <= i_data;
            end
        end

        assign o_data = r_data;

    endmodule
`endif
