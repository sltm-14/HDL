//-----------------------------------------------------------------------
// NOMBRE DEL MODULO: clkDivider.sv
// DESCRIPCION: Implementeacion de divisor de frecuencia
// ENTRADAS: i_clk_FPGA (Reloj inicial) reset (reinicio del programa)
// SALIDAS:  o_clk (Reloj de salida)
// VERSION:  1.0
// AUTORES:  Andres Hernandez, Carem Bernabe
// FECHA:    18 / 02 / 19
//
// localparam	FREQUENCY_IN 	= 10000; /* Value of input frequency */
// localparam	FREQUENCY_OUT	= 1; 	 /* Value of output frequency */
// localparam	MAX_COUNT		= (FREQUENCY_IN/FREQUENCY_OUT)/2; /* Value of counter */
//
// typedef logic [31:0] counter_t; 	 /* Counter type */
//
//-----------------------------------------------------------------------

module clkDivider
import clk_pkg::*;
(
	// Input signals
	input 			i_reset,
	input 			i_clk_FPGA,

	// Output signal
	output logic  	o_clk
);

counter_t r_counter = 0; // Frequency counter

always_ff@(posedge i_clk_FPGA, negedge i_reset) begin: count
	if(!i_reset) // Reset counter
	begin
		o_clk   	<= '0;
		r_counter 	<= '0;
	end
	else if(r_counter == (MAX_COUNT - 1'b1)) // If counter gets to the limit
	begin
		r_counter 	<= '0;      // counter is set to 0
		o_clk   	<= ~o_clk;  // o_clk suffles its state
	end
	else
	begin
		r_counter 	<= r_counter + 1'b1; //increase  counter
		o_clk   	<= o_clk;		     //o_clk keeps its value
	end
end: count

endmodule
