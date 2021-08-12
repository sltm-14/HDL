
module motor_dmx(
    input            i_Clk,
    input            i_Rst,
    input      [2:0] i_motor,
    input            i_enable,
    
    output reg [3:0] o_motor
);



always @(posedge i_Clk, posedge i_Rst)begin

    if ( i_Rst )begin
        o_motor <= 4'b0000;
    end 
    
    else begin
        if ( i_enable ) begin
            case(i_motor)
                3'b001:  o_motor <= 4'b0001;
                3'b010:  o_motor <= 4'b0010;
                3'b011:  o_motor <= 4'b0100;
                3'b100:  o_motor <= 4'b1000;
                default: o_motor <= 4'b0000;
            endcase
        end 
        else begin
            o_motor <= 4'b0000;
        end    
    end

end 

endmodule
