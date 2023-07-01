module CheckSequence(
input [1:0] Din,
input Reset,
input Clk,
output reg [1:0] Dout);

reg [2:0] cs = 3'b000, ns;
 always @(posedge Clk)
begin
    cs <= ns;
    if(Reset)
    begin
        cs <= 3'b000;
        ns <= 3'b000;
        Dout <= 2'bxx;
    end
    else
    case({Din, cs})
        5'b10_000: ns <= 3'b001;
        5'b10_001: ns <= 3'b010;
        5'b10_010: ns <= 3'b100;
        default: ns <= 2'b00;
    endcase
    if(cs == 3'b010)
        Dout <= 2'b10;
end
endmodule
