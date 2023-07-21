module Mux32BIT_tb;
reg [31:0] A;
reg [31:0] B;
reg Sel;
wire [31:0] Out;

Mux32Bit mux_DUTY(
            .A(A),
            .B(B),
            .Sel(Sel),
            .Out(Out));
            
initial
begin
    #0
        A <= 32'hCAAEAC02;
        B <= 32'hFCABC030;
        Sel <= 1'b1;
    #10
        Sel <= 1'b0;
    #10
        $finish;
end
endmodule
