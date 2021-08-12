`timescale 1ns / 1ps

module uth_converter(
    input       i_clk,
    input       i_rst,
    
    input [3:0] i_units,
    input [3:0] i_tens,
    input [3:0] i_hundreds,
    
    output  [8:0] o_degrees
);

    reg [3:0] r_units;
    reg [6:0] r_tens;
    reg [7:0] r_hundreds;

always @(posedge i_clk, negedge i_rst)begin
    if (i_rst)begin
        r_units    <= 0;
        r_tens     <= 0;
        r_hundreds <= 0;
    end
    
    else begin
    
        r_units <= i_units;
        
         case(i_tens)
         /*0*/ 4'b0000: r_tens <= 7'b0000_0000; /*degrees + 00*/
         /*1*/ 4'b0001: r_tens <= 7'b0000_1010; /*degrees + 10*/
         /*2*/ 4'b0010: r_tens <= 7'b0001_0100; /*degrees + 20*/
         /*3*/ 4'b0011: r_tens <= 7'b0001_1110; /*degrees + 30*/
         /*4*/ 4'b0100: r_tens <= 7'b0010_1000; /*degrees + 40*/
         /*5*/ 4'b0101: r_tens <= 7'b0011_0010; /*degrees + 50*/
         /*6*/ 4'b0110: r_tens <= 7'b0011_1100; /*degrees + 60*/
         /*7*/ 4'b0111: r_tens <= 7'b0100_0110; /*degrees + 70*/
         /*8*/ 4'b1000: r_tens <= 7'b0101_0000; /*degrees + 80*/
         /*9*/ 4'b1001: r_tens <= 7'b0101_1010; /*degrees + 90*/
        endcase  
         
        case(i_hundreds)
         /*0*/ 4'b0000: r_hundreds <= 8'b0000_0000; /*degrees + 000*/
         /*1*/ 4'b0001: r_hundreds <= 8'b0110_0100; /*degrees + 100*/
         /*2*/ 4'b0010: r_hundreds <= 8'b1100_1000; /*degrees + 200*/
        endcase 
             
     end
end

assign o_degrees = r_units + r_tens + r_hundreds;

endmodule
