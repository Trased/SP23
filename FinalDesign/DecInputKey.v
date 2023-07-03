module Controller(
input [4:0] InputKey,
input ValidCmd,
input Reset,
input Clk,
output reg Active,
output reg Mode);

reg CorrectInput;
reg[1:0] cs = 2'b00, ns;

always@(cs or ns)
    cs <= ns;

always@(posedge Clk or posedge Reset)
begin
    if(Reset)
    begin
        Active <= 1'b0;
        Mode <= 1'b0;
        CorrectInput <= 1'b0;
        ns <= 2'b00;
    end
    else
    begin
        if(ValidCmd)
            begin
                if(!CorrectInput)
                    casex({InputKey, cs})
                        7'bxxxx1_00: ns <= 2'b01;
                        7'bxxx0x_01: ns <= 2'b10;
                        7'bxx1xx_10: ns <= 2'b11;
                        7'bx0xxx_11: CorrectInput <= 1'b1; // De ce in model se testeaza 10101 in loc de doar 1010 ?? 
                        default: ns<= 2'b00;
                    endcase
                else
                begin
                    Active <=1'b1;
                    Mode <= InputKey[4:4];
                end 
            end
    end
end

endmodule
