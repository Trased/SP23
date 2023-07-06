module TopModule(
input InputKey, ValidCmd, RWMem, ConfigDiv, Reset, Clk,
input[7:0] Addr, InA, InB,
input[3:0] Sel,
input[31:0] DIn,
output CalcActive, CalcMode, Busy, DOutValid, DataOut, ClkTx);

wire [31:0] ConcatOutTmp, MemDout, TxDinTmp;
wire [7:0] MuxInATmp, MuxInBTmp, AluOutTmp; 
wire [3:0] MuxSelTmp, AluFlagTmp;
wire SampleData, StartTx, CtrlTransferDataTmp, ClkTmp, Active, CtrlRWMemTmp, CtrlAccessMemTmp, CtrlModeTmp;
reg ResetTmp, RWTmp;


always@(*)
begin
    if(!Active || Reset)
        ResetTmp <= 1'b1;
    else
        ResetTmp <= 1'b0;
    if(Active && RWMem)
        RWTmp <= 1'b1;
    else
        RWTmp <= 1'b0;
end

assign CalcActive = Active;
assign CalcMode = CtrlModeTmp;
assign ClkTx = ClkTmp;

Mux8Bit #(8) MuxA_DUT(InA, ResetTmp, MuxInATmp);

Mux8Bit #(8) MuxB_DUT(InB, ResetTmp, MuxInBTmp);

Mux8Bit #(4) MuxSel_DUT(Sel, ResetTmp, MuxSelTmp);

ALU ALU_DUT(MuxInATmp, MuxInBTmp, MuxSelTmp, AluOutTmp, AluFlagTmp);

DecInputKey InputKey_DUT(InputKey, ValidCmd, ResetTmp, Clk, Active, CtrlModeTmp);

RW_flow Controller_DUT(Active, CtrlMode, ValidCmd, RWTmp, ResetTmp, Clk, CtrlTransferDataTmp, CtrlAccessMemTmp, CtrlRWMemTmp, SampleData, TxData, Busy);

Concatenator Concatenator_DUT(MuxInATmp, MuxInBTmp, AluOutTmp, MuxSelTmp, AluFlagTmp, ConcatOutTmp);

Memory #(8, 32) Memory_DUT(DIn, Addr, CtrlRWMemTmp, CtrlAccessMemTmp, ResetTmp, Clk, MemDout);

Mux32Bit #(32) Mux32Bit_DUT(ConcatOutTmp, MemDout,CtrlModeTmp, TxDinTmp);

SerialTransciever #(32) SerialTransciever_DUT(TxDinTmp, SampleData, StartTx, ResetTmp, Clk, ClkTmp, CtrlTransferDataTmp, DoutValid, DataOut);

FrequencyDivider FrequencyDivider_DUT(DIn, ConfigDiv, ResetTmp, Clk, Active, ClkTmp);


endmodule
