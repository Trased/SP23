module Mux32Bit(
input [31:0] A,
input [31:0] B,
input Sel,
output reg [31:0] Out);

always@(*)
    if(Sel)
        Out <= B;
    else
        Out <= A;
endmodule
