/*-----------------------------------------------
* MODULE: 	  clk_pkg.sv
* DESCRITION: Packege for clk divider
* VERSION:    1.0
* AUTHORS:    Andres Hernandez, Carem Acosta
* DATE:       10 / 03 / 19
* ----------------------------------------------*/
package clk_pkg;

localparam	FREQUENCY_IN 	= 10000; /* Value of input frequency */
localparam	FREQUENCY_OUT	= 1; 	 /* Value of output frequency */
localparam	MAX_COUNT		= (FREQUENCY_IN/FREQUENCY_OUT)/2; /* Value of counter */

typedef logic [31:0] counter_t; 	 /* Counter type */

endpackage: clk_pkg
