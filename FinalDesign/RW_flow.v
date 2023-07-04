module RW_flow(
input Active, Mode, ValidCmd, RW, Reset, Clk, TxDone,
output reg AccessMem, RWMem, SampleData, TxData, Busy);

reg [1:0] cs = 2'b00, ns;

always@(cs or ns)
    cs <= ns;

always@(posedge Clk or posedge Reset)
begin
    if(Reset)
        begin
            AccessMem <= 1'b0;
            RWMem <= 1'b0;
            SampleData <= 1'b0;
            TxData <= 1'b0;
            Busy <= 1'b0;
        end
    else
        begin
            casex({cs, ValidCmd, Active, Mode, RW})
              6'b00_0_0_0_0:  Busy <= 1'b1; /// posibil asa trebuie facut, need to review ... MUST BE DONE TODAY!  
            endcase
        end
end
endmodule
