
module motor_sync_full(
       input       i_Clk,
       input       i_Rst,
       input [3:0] i_Signals,
       
       output [3:0] o_SyncSignals
    );
    
    
    motor_sync SYNCM_0(
        .clk(i_Clk),
        .rst(i_Rst),
        .signal(i_Signals[0]),
            
        .long_signal(o_SyncSignals[0])
    );
    
     motor_sync SYNCM_1(
        .clk(i_Clk),
        .rst(i_Rst),
        .signal(i_Signals[1]),
            
        .long_signal(o_SyncSignals[1])
    );
    
    motor_sync SYNCM_2(
        .clk(i_Clk),
        .rst(i_Rst),
        .signal(i_Signals[2]),
            
        .long_signal(o_SyncSignals[2])
    );
    
     motor_sync SYNCM_3(
        .clk(i_Clk),
        .rst(i_Rst),
        .signal(i_Signals[3]),
            
        .long_signal(o_SyncSignals[3])
    );
    
    
endmodule
