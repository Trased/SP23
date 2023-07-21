module RW_flow_tb;
reg Active, Mode, ValidCmd, RW, Reset, Clk, TxDone;
wire AccessMem, RWMem, SampleData, TxData, Busy;

RW_flow DUT(
            .Active(Active),
            .Mode(Mode),
            .ValidCmd(ValidCmd),
            .RW(RW),
            .Reset(Reset),
            .Clk(Clk),
            .TxDone(TxDone),
            .AccessMem(AccessMem),
            .RWMem(RWMem),
            .SampleData(SampleData),
            .TxData(TxData),
            .Busy(Busy));
            
initial
begin
    #0 Clk <= 1'b0;
    forever #5 Clk <= ~Clk;
end

initial
begin
       #0
        Mode <= 1'b0;
        Active <= 1'b0;
        RW <= 1'b0;
        Reset <= 1'b1;
        TxDone <= 1'b0;
        ValidCmd <= 1'b0;
   #20
        Reset <= 1'b0;
   #30
        ValidCmd <= 1'b1;
        Mode <= 1'b1;
        Active <= 1'b1;
   #10
        ValidCmd <= 1'b0; 
   #162
        TxDone <= 1'b1;
   #15
        TxDone <= 1'b0;
   #95
        Mode <= 1'b0;
   #25
        $finish;     
end

endmodule
