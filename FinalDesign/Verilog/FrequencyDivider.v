module FrequencyDivider(
input [31:0] Din,
input ConfigDiv, Reset, Clk, Enable,
output reg ClkOut);

reg [31:0] T;
reg [31:0] counter = 0;
always@(Clk or posedge Reset)
begin
    if(Reset)
    begin
        ClkOut <= 1'b0;
        counter <= 1;
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
            if(T == 1)
                ClkOut <= Clk;
            else if(Clk == 1)
            begin
                counter <= counter + 1;
                if(counter >=(T-1))
                    counter <= 0;
                ClkOut <= (counter<T/2)?1'b1:1'b0;
            end
        end
    end     
end

endmodule