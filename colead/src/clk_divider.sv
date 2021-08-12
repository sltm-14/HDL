//-----------------------------------------------
// NOMBRE DEL MODULO: clk_divider.sv
// DESCRIPCION:       Implementeacion de divisor de frecuencia, alcanza una salida de hasta 1 Hz
// ENTRADAS:          i_clk_FPGA (Reloj inicial) reset (reinicio del programa)
// SALIDAS:           o_clk (Reloj de salida)
// VERSION:           1.0
// AUTORES:           Andres Hernandez, Carem Bernabe
// FECHA:             18 / 02 / 19
//----------------------------------------------

module clk_divider
#(
	parameter FRECUENCY_IN  = 50_000_000,
	parameter FRECUENCY_OUT = 2
)(
	// Input signals
	input i_reset,
	input i_clk,

	// Output signal
	output                o_clk
);

	localparam CONST   = (FRECUENCY_IN/FRECUENCY_OUT)/2; // Counter limit
	localparam COUNT_W = 25;

	reg [COUNT_W-1:0] r_count = 1'b0; // Frequency counter
	reg               r_clk   = 1'b1;

	always@(posedge i_clk, posedge i_reset) begin

		if(i_reset) begin 				  // Reset counter
			r_clk   <= 1'b0;
			r_count <= 1'b0;
		end

		else if(r_count == (CONST - 1'b1)) begin // If counter gets to the limit
			r_clk   <= ~r_clk; 					 // o_clk suffles its state
			r_count <= 1'b0;     				 // counter is set to 0
		end

		else begin
			r_count <= r_count + 1'b1; 			//add one to counter
			r_clk   <= r_clk;		   			//o_clk keeps its value
		end

	end

	assign o_clk   = r_clk;

endmodule
