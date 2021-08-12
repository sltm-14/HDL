module motor_sync(
    input   clk,
    input   rst,
    input   signal,
    
    output  long_signal
    );
    
    reg        r_signal = 0;
    reg [10:0] r_count  = 0;
    
    always @ (posedge clk, negedge rst)begin
        
        if (rst) begin
            r_count  = 0;
            r_signal = 0; 
        end 
        
        else if(signal)begin
            r_count  = 0;
            r_signal = 1; 
        end
        
        else  if ((r_count < 11'b100_1110_0010) && r_signal == 1) begin
            r_count = r_count + 1'b1;
        end 
        
        else begin
            r_signal = 1'b0;
            r_count = r_count;
        end
       
    end
    
    assign long_signal = r_signal;
    
endmodule
