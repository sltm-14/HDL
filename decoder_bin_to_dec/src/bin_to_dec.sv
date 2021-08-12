module dec_to_bin(
    input [3:0] i_d,

    output o_b1,
    output o_b2,
    output o_b3,
    output o_b4,
    output o_b5,
    output o_b6,
    output o_b7
    );

    logic [7:0] r_dec;

    always_comb begin
        case (i_d)
            3'b000:
                r_dec = 7'b000_0000;
            3'b001:
                r_dec = 7'b000_0001;
            3'b010:
                r_dec = 7'b000_0010;
            3'b011:
                r_dec = 7'b000_0100;
            3'b100:
                r_dec = 7'b000_1000;
            3'b101:
                r_dec = 7'b001_0000;
            3'b110:
                r_dec = 7'b010_0000;
            3'b111:
                r_dec = 7'b100_0000;
            default:
                r_dec = 7'b000_0000;
        endcase
    end

    assign {o_b7,o_b6,o_b5,o_b4,o_b3,o_b2,o_b1} = r_dec;

endmodule
