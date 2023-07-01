module ALU(
input [7:0] A,
input [7:0] B,
input [3:0] Sel,
output reg [7:0] Out,
output reg [3:0] Flag);

// Flag[3:3] ==> UnderflowFlag
// Flag[2:2] ==> OverflowFlag
// Flag[1:1] ==> CarryFlag
// Flag[0:0] ==> ZeroFlag

always@(*)
begin
     Flag <= 4'h0; //Maybe trebuie sa fie resetat la fiecare istanta?? flagurile raman active
    case(Sel)
        4'h0: {Flag[1:1], Out} = A+B;
        4'h1: {Flag[3:3], Out} = A-B;
        4'h2: 
            begin
            if(A > 8'hF && B > 8'hF) // Ar trebui reverificat ?? caz A = 8'hFF , B = 2'h02 nu ne da overflow, desi ar trebui
                Flag[2:2] <= 1'b1;
            Out <= A*B;
            end
        4'h3: 
            begin
            if(A < B)
                Flag[3:3] <= 1'b1;
            Out <= A/B;
            end        
        4'h4: Out <= A<<B;
        4'h5: Out <= A>>B;
        4'h6: Out <= A & B; // Bitwise AND or not?
        4'h7: Out <= A | B; // Bitwise OR or not?
        4'h8: Out <= A ^ B;
        4'h9: Out <= A ~^ B;
        4'hA: Out <= ~(A & B);
        4'hB: Out <= ~(A | B);
        default:
            begin
            Out <= 8'h00;
            Flag <= 4'h0;
            end
        
    endcase
    if(Out == 0 && Sel < 4'hC)
        Flag[0:0] <= 1'b1;
end   
endmodule
