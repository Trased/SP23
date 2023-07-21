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
           
 
 wire [1:0] rwFlag;
 assign  rwFlag = DUT.rwFlag;
initial
begin
    #0 Clk <= 1'b0;
    forever #5 Clk <= ~Clk;
end

initial
begin
    #0
        Mode <= 1'b0;
        Active <= 1'b1;
        RW <= 1'b0;
        Reset <= 1'b1;
        TxDone <= 1'b0;
        ValidCmd <= 1'b0;   
    #3
        Reset <= 1'b0; 
        Mode <= 1'b1;
        RW <= 1'b1;
        ValidCmd <= 1'b1;
    #10
        RW <= 1'b0;
        ValidCmd <= 1'b0;
    #1
        TxDone <= 1'b1;
    #6
        TxDone <= 1'b0;
    #20
        $finish; 
end

endmodule
