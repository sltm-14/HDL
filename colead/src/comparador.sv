module comparador(
	input	clk, 
	input   rst,
	input	[21:0] YY,
	
	output reg iguales  );

    reg [21:0] CuentaCada20ns;		
    
    always @ (posedge rst or posedge clk) begin
      if (rst) 
          CuentaCada20ns <= 0;  
      else if (iguales) 
          CuentaCada20ns <= 0;
      else if (YY) 
            CuentaCada20ns <= CuentaCada20ns +1;
      else 
          CuentaCada20ns <= CuentaCada20ns;
    end

    always @(YY , CuentaCada20ns) begin
        if (CuentaCada20ns == YY) 
          iguales = 'b1; 
        else 
          iguales = 0;
    end
    
endmodule
