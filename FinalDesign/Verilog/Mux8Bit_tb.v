module Mux_tb;
reg [7:0] A;
reg Sel;
wire [7:0] Out;

Mux8Bit mux_DUT(
            .A(A),
            .Sel(Sel),
            .Out(Out));
            
initial
begin
    #0
        A <= 8'hAC;
        Sel <= 1'b1;
    #10
        Sel <= 1'b0;
    #10
        $finish;
end
endmodule
