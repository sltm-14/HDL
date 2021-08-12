
module bin_to_ot(
    input [5:0]  i_Bin,     //Se introduce el valor que se quiere separar en unidades, decenas y centenas

    output [3:0] o_Tens,   //Salida para las decenas
    output [3:0] o_Ones    //Salida para las unidades
    );

    // Cables para pasar y hacer shift de cada uno de los modulos sumadores
    wire [13:0] w_valS0;
    wire [13:0] w_valS1;
    wire [13:0] w_valS2;
    wire [13:0] w_valS3;
    wire [13:0] w_valS4;
    wire [13:0] w_valS5;
    wire [13:0] w_valS6;

    wire [13:0] w_switch;

    //Para iniciar se toman los valores de entrada y se recorren en cada suma
    assign w_valS0 = {8'b0000_0000,i_Bin[5:0]};

    //Se hacen las sumas correspondientes si son necesarias
    add_condition a0( .i_hto(w_valS0),         .o_hto(w_valS1) );
    add_condition a1( .i_hto(w_valS1 << 1'b1), .o_hto(w_valS2) );
    add_condition a2( .i_hto(w_valS2 << 1'b1), .o_hto(w_valS3) );
    add_condition a3( .i_hto(w_valS3 << 1'b1), .o_hto(w_valS4) );
    add_condition a4( .i_hto(w_valS4 << 1'b1), .o_hto(w_valS5) );
    add_condition a5( .i_hto(w_valS5 << 1'b1), .o_hto(w_valS6) );

    //Se reparte el valor entero a sus unidades y decenas
    assign w_switch   = w_valS6 << 1'b1;

    assign o_Tens     = w_switch[13:10];
    assign o_Ones     = w_switch[9:6];

endmodule
