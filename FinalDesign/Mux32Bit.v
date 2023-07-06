module Mux32Bit#(parameter WIDTH = 32)(
input [WIDTH-1:0] A,
input [WIDTH-1:0] B,
input Sel,
output reg [WIDTH-1:0] Out);

always@(*)
    if(Sel)
        Out <= B;
    else
        Out <= A;
endmodule