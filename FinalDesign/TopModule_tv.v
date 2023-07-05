module TopModule_tb;
reg InputKey, ValidCmd, RWMem, ConfigDiv, Reset, Clk;
reg[7:0] Addr, InA, InB;
reg[3:0] Sel;
reg[31:0] Din;
wire CalcActive, CalcMode, Busy, DOutValid, DataOut, ClkTx;

TopModule Top_DUT(
        .InputKey(InputKey),
        .ValidCmd(ValidCmd),
        .RWMem(RWMem),
        .ConfigDiv(ConfigDiv),
        .Reset(Reset),
        .Clk(Clk),
        .Addr(Addr),
        .InA(InA),
        .InB(InB),
        .Sel(Sel),
        .DIn(Din),
        .CalcActive(CalcActive),
        .CalcMode(CalcMode),
        .Busy(Busy),
        .DOutValid(DOutValid),
        .DataOut(DataOut),
        .ClkTx(ClkTx)
    );

wire [31:0] TxDinTmp;
wire Activewww;
assign TxDinTmp = Top_DUT.TxDinTmp;
assign Activewww = Top_DUT.ActiveTmp;

initial
begin
    #0 Clk = 1'b0;
    forever #5 Clk = ~Clk; 
end

initial
begin
    #0
        InputKey <= 1'b0;
        ValidCmd <= 1'b0;
        RWMem <= 1'b0; 
        ConfigDiv <= 1'b0;
        Reset <= 1'b1;
        Addr <= 8'h00;
        InA <= 8'hAB; 
        InB <= 8'h54;
        Sel <= 4'h0;
        Din <= 32'h0000_0001; 
        ConfigDiv <= 1'b1;
    #7
        Reset <= 1'b0;
        ValidCmd <= 1'b1;
        InputKey <= 1'b1;
    #10
        InputKey <= 1'b0;
    #10
        InputKey <= 1'b1;
        ConfigDiv <= 1'b0;
    #10
        InputKey <= 1'b0;

    #500
        $finish;
      
end

endmodule
