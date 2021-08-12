module project_colead_tb;

   reg clk;
   reg rst;

   reg i_add_sec;
   reg i_add_min;
   reg i_add_hr;
   reg i_Sw_Clk;
   reg i_Start_Stop;
   reg i_reset;

   wire a;
   wire b;
   wire c;
   wire d;
   wire e;
   wire f;
   wire g;
   wire [3:0] an;

   stopwatch_clock_top TOP(
       .clk(clk),
       .rst(rst),

       .i_add_sec(i_add_sec),
       .i_add_min(i_add_min),
       .i_add_hr(i_add_hr),
       .i_Sw_Clk(i_Sw_Clk),
       .i_Start_Stop(i_Start_Stop),
       .i_reset(i_reset),

       .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g),
       .an(an)
   );

   always #1 clk = ~clk;

   initial begin
       i_add_sec    = 0;
       i_add_min    = 0;
       i_add_hr     = 0;
       i_Sw_Clk     = 0;
       i_Start_Stop = 0;
       i_reset      = 0;

       clk   = 0; #5
       rst   = 0; #2
       rst   = 1; #2;
       rst   = 0; #4;
   end

endmodule
