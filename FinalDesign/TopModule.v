module TopModule(
input InputKey, ValidCmd, RWMem, ConfigDiv, Reset, Clk,
input[7:0] Addr, InA, InB,
input[3:0] Sel,
input[31:0] DIn,
output CalcActive, CalcMode, Busy, DOutValid, DataOut, ClkTx);

reg ResetTmp, RWTmp;
wire [31:0] ConcatOutTmp, MemOutTmp, TxDinTmp;
wire [7:0] MuxInATmp, MuxInBTmp, AluOutTmp;
wire [3:0] MuxSelTmp, AluFlagTmp;
wire ActiveTmp, CtrlModeTmp, CtrlTransferDataTmp, CtrlRWMemTmp, CTRLAccessMemTmp, SampleData, TxData;

always@(*)
begin
    if(!ActiveTmp || Reset)
        ResetTmp <= 1'b1;
    else
        ResetTmp <= 1'b0;
    if(ActiveTmp && RWMem)
        RWTmp <= 1'b1;
    else
        RWTmp <= 1'b0;
end


assign CalcActive = ActiveTmp;
assign CalcMode = CtrlModeTmp;

Mux8Bit #(8) MuxA_DUT(A, ResetTmp, MuxInATmp);

Mux8Bit #(8) MuxB_DUT(B, ResetTmp, MuxInBTmp);

Mux8Bit #(4) MuxSel_DUT(Sel, ResetTmp, MuxSelTmp);

ALU ALU_DUT(MuxInATmp, MuxInBTmp, MuxSelTmp, AluOutTmp, AluFlagTmp);

DecInputKey InputKey_DUT(InputKey,ValidCmd, Reset, Clk, ActiveTmp, CtrlModeTmp);

RW_flow Controller_DUT(Active, Mode, ValidCmd, RWTmp, Reset, Clk, CtrlTransferDataTmp,CTRLAccessMemTmp, CtrlRWMemTmp, SampleData, TxData, Busy);

Concatenator Concatenator_DUT(MuxInATmp, MuxInBTmp, AluOutTmp, MuxSelTmp, AluFlagTmp, ConcatOutTmp);

Memory #(8, 32) Memory_DUT(ConcatOutTmp, Addr, CtrlRWMemTmp, CtrlAccessMemTmp, ResetTmp, Clk, MemOutTmp);

Mux32Bit #(32) Mux32Bit_DUT(ConcatOutTmp, MemOutTmp, CtrlModeTmp, TxDinTmp);

SerialTransciever #(32) SerialTransciever_DUT(TxDinTmp, SampleData, TxData, ResetTmp, Clk, ClkTx, CtrlTransferDataTmp, DOutValid, DataOut);

FrequencyDivider FrequencyDivider_DUT(DIn, ConfigDiv, ResetTmp, Clk, ActiveTmp, ClkTx);
endmodule
