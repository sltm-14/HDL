`timescale 1ns / 1ps

module divider(
//	input         i_Clk,
//  input         i_Rst,
    input  [4:0]  i_Divisor,
    input  [12:0] i_Dividendo,
    
    output reg [9:0] o_Result
);
        
    reg [13:0] r_Residuo;
    reg [5:0]  r_Divisor;
    reg [9:0]  r_Result;
    reg [2:0]  r_MCount = 3'b000;
        
    reg [3:0]  r_Bit;
    
always @ (*)begin
        
//            if ( i_Rst ) begin
//                r_Residuo = 0;
//                r_Divisor = 0;
//                r_Result  = 0;
//                o_Result  = 0;
//                r_Bit     = 4'b1010;
//            end
        
        
            r_Residuo = i_Dividendo >> 4'b1001;
            r_Divisor = i_Divisor;
    
            for ( r_Bit = 4'b1010 ; r_Bit > 0 ; r_Bit = r_Bit - 1'b1 ) begin
                
                r_Result = r_Result << 1;
                    
                if (r_Residuo >= r_Divisor) begin
                    r_Residuo   = r_Residuo - r_Divisor;
                    r_Result[0] = 1'b1;
                end
                    
                else begin
                    r_Result[0] = 1'b0;
                end
                    
                r_Residuo    = r_Residuo << 1;
                r_Residuo[0] = i_Dividendo[r_Bit-2];           
                            
            end
                
            if((r_Divisor >> 1) < r_Residuo)begin
                o_Result = r_Result + 1'b1;
            end
            else begin
                o_Result = r_Result;
            end
                    
            r_Residuo = 0;
            r_Divisor = 0;
                
        end
    
endmodule
