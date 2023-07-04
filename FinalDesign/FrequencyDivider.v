module FrequencyDivider(
input [31:0] Din,
input ConfigDiv, Reset, Clk, Enable,
output reg ClkOut);

reg [31:0] T;
reg [31:0] counter;
always@(posedge Clk or posedge Reset)
begin
    if(Reset)
    begin
        ClkOut <= 1'b0;
    end
    else
    begin
        if(!Enable)
        begin
            ClkOut <= 1'b0;
            if(ConfigDiv)
                T <= Din;
        end
        else
        begin
           if(counter < (T/2)) // TO FIX : DIV 1 , DIV 5 .. cmon...
                counter = counter + 1;
           else
                counter = 0;
                ClkOut <= ~ClkOut; 
        end
    end
      
end

endmodule
