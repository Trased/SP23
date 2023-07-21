module Mux8Bit #(parameter WIDTH = 8)(
input [WIDTH-1:0] A,
input Sel,
output reg [WIDTH-1:0] Out);

always@(*)
    if(Sel)
        Out <= {WIDTH{1'b0}};
    else
        Out <= A;
endmodule