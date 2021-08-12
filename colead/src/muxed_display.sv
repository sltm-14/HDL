module muxed_display(
     input clk,
     input rst,

     input [3:0] i_v0,
     input [3:0] i_v1,
     input [3:0] i_v2,
     input [3:0] i_v3,

     output       a, b, c, d, e, f, g,
     output [3:0] an
 );

reg [11:0]r_count;

always @ (posedge clk or posedge rst)begin
    if (rst)
        r_count <= 12'b0000_0000_0000;
    else
        r_count <= r_count + 1'b1;
end

reg [3:0] r_val;
reg [3:0] r_an;
reg [6:0] r_segments;

always @ (*) begin
    case(r_count[11:10])

        2'b00: begin
            r_val = i_v0;
            r_an = 4'b1110;
        end

        2'b01: begin
            r_val = i_v1;
            r_an = 4'b1101;
        end

        2'b10: begin
            r_val = i_v2;
            r_an = 4'b1011;
        end

        2'b11: begin
            r_val = i_v3;
            r_an = 4'b0111;
        end
        default: begin
            r_val = i_v3;
            r_an  = 4'b0000;
        end
    endcase
 end

always @ (*) begin
    case(r_val)
        4'd0 :    r_segments = 7'b1000000; // 0 will be displayed
        4'd1 :    r_segments = 7'b1111001; // 1 will be displayed
        4'd2 :    r_segments = 7'b0100100; // 2 will be displayed
        4'd3 :    r_segments = 7'b0110000; // 3 will be displayed
        4'd4 :    r_segments = 7'b0011001; // 4 will be displayed
        4'd5 :    r_segments = 7'b0010010; // 5 will be displayed
        4'd6 :    r_segments = 7'b0000010; // 6 will be displayed
        4'd7 :    r_segments = 7'b1111000; // 7 will be displayed
        4'd8 :    r_segments = 7'b0000000; // 8 will be displayed
        4'd9 :    r_segments = 7'b0010000; // 9 will be displayed
        default : r_segments = 7'b0111111; // - will be displayed
    endcase
end

assign {g, f, e, d, c, b, a} = r_segments;
assign an = r_an;


endmodule
