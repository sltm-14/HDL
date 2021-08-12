module dec_to_bin(
    input i_d1,
    input i_d2,
    input i_d3,
    input i_d4,
    input i_d5,
    input i_d6,
    input i_d7,

    output [3:0] o_b
    );

    logic [7:0] r_dec;
    logic [3:0] r_b;

    always_comb begin
        r_dec = {i_d7,i_d6,i_d5,i_d4,i_d3,i_d2,i_d1};
    end

    always_comb begin
        case (r_dec)
            7'b000_0000:
                r_b = 3'b000;
            7'b000_0001:
                r_b = 3'b001;
            7'b000_0010:
                r_b = 3'b010;
            7'b000_0100:
                r_b = 3'b011;
            7'b000_1000:
                r_b = 3'b100;
            7'b001_0000:
                r_b = 3'b101;
            7'b010_0000:
                r_b = 3'b110;
            7'b100_0000:
                r_b = 3'b111;
            default:
                r_b = 3'b000;
        endcase
    end

    assign o_b = r_b;

endmodule
