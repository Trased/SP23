module FrequencyDivider(
input [31:0] Din,
input ConfigDiv, Reset, Clk, Enable,
output reg ClkOut);

reg [32:0] ConfigReg;

always@(posedge Clk or posedge Reset)
    if(Reset)
        begin
            ConfigReg <= 33'b0;
            ClkOut <= 1'b0;
        end 
    else if(!Enable)
        begin
            ClkOut <= 1'b0;
            if(!ConfigDiv)
                begin
                    ClkOut <= ConfigReg[0:0] * Clk; // daca ConfigDiv == 0, folosesc ConfigReg[0:0], altfel asignez in ConfigReg valoarea la Din;
                end
        end   

endmodule
