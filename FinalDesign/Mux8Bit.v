module Mux8Bit(
input [7:0] A,
input Sel,
output reg [7:0] Out);

always@(*)
    if(Sel)
        Out <= 8'h00;
    else
        Out <= A;
endmodule
