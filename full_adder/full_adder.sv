
module fullAdder (
    input In1,
    input In2,
    input Cin;

    output Sum,
    output Cout;

   );

assign Sum  = (In1 ^ In2) ^ Cin;

assign Cout = (In1 & In2) | (In2 & Cin) | (Cin & In1);

endmodule
