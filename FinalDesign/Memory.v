module Memory #(parameter WIDTH = 8, DinLength = 32) (
input [DinLength-1:0] Din,
input [WIDTH-1:0] Addr,
input R_W,
input Valid,
input Reset,
input Clk,
output reg [DinLength-1:0] Dout);

integer res;
reg [DinLength-1:0] Mem [0: WIDTH-1];

always @(posedge Clk or posedge Reset)
begin
    // Maybe sa pun sa se reseteze outputu la fiecare clock ??
    // Dout <= {DinLength{1'bX}};  Dar lasam asa :) 
    if(Reset)
        begin
           for(res = 0; res < WIDTH; res = res+1)
            begin
                Mem[res] <= {DinLength{1'bX}};
            end 
           Dout <= {DinLength{1'bX}};
        end
    else if (R_W == 1'b0)
        begin
            Dout <= Mem[Addr];
        end
    else if(R_W == 1'b1)
        begin
            Mem[Addr] <= Din;
        end  
end


endmodule


