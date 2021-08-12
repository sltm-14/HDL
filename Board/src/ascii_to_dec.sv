
module ascii_to_dec(
    input      [7:0] i_Ascii,

    output     [3:0] o_Dec
);
    localparam SPACE    = 4'b1010;  //10
    localparam ENTER    = 4'b1011;  //11
    localparam FORWARD  = 4'b1100;  //12
    localparam BACKWARD = 4'b1101;  //13
    localparam INVALID  = 4'b1110;  //14
    
    reg [3:0] r_Dec = INVALID;
    
    always @(*)begin
            
        if ((i_Ascii <= 8'b0011_1001) && (i_Ascii >= 8'b0011_0000))begin
            r_Dec <= i_Ascii - 8'b0011_0000;
        end
        else if ( 8'b0000_1101 == i_Ascii)begin
            r_Dec <= ENTER;
        end
        else if ( 8'b0010_1011 == i_Ascii)begin
            r_Dec <= FORWARD;
        end
        else if ( 8'b0010_1101 == i_Ascii)begin
            r_Dec <= BACKWARD;
        end
        else if ( 8'b0010_0000 == i_Ascii )begin
            r_Dec <= SPACE;
        end
        else begin
            r_Dec <= INVALID;
        end
         
    end
    
    assign o_Dec = r_Dec;
    
endmodule