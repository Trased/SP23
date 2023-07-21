module TopModule_tb;
reg InputKey, ValidCmd, RWMem, ConfigDiv, Reset, Clk;
reg[7:0] Addr, InA, InB;
reg[3:0] Sel;
reg[31:0] Din;
wire CalcActive, CalcMode, Busy, DOutValid, ClkTx;
wire [3:0] DataOut;

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
// FREQUENCY DIVIDER
//assign FDT = Top_DUT.FrequencyDivider_DUT.T;
//assign FDENABLE = Top_DUT.FrequencyDivider_DUT.Enable;
//assign FDDIN = Top_DUT.FrequencyDivider_DUT.Din;
//assign FDCONFIGDIV = Top_DUT.FrequencyDivider_DUT.ConfigDiv;
//assign FDRESET = Top_DUT.FrequencyDivider_DUT.Reset;
//assign FDCLK = Top_DUT.FrequencyDivider_DUT.Clk;
//assign FDCLKOUT = Top_DUT.FrequencyDivider_DUT.ClkOut;


// MUX A
//wire [7:0]MUXAA, MUXAOUT;
// assign MUXAA = Top_DUT.MuxA_DUT.A;
// assign MUXASEL = Top_DUT.MuxA_DUT.Sel;
// assign MUXAOUT = Top_DUT.MuxA_DUT.Out;

// MUX B
//wire [7:0]MUXBA, MUXBOUT;
// assign MUXBA = Top_DUT.MuxB_DUT.A;
// assign MUXBSEL = Top_DUT.MuxB_DUT.Sel;
// assign MUXBOUT = Top_DUT.MuxB_DUT.Out;

// MUX SEL
//wire [3:0]MUXSELA, MUXSELOUT;
// assign MUXSELA = Top_DUT.MuxSel_DUT.A;
// assign MUXSELSEL = Top_DUT.MuxSel_DUT.Sel;
// assign MUXSELOUT = Top_DUT.MuxSel_DUT.Out;

// ALU
//wire[7:0] ALUA, ALUB, ALUOUT;
//wire[3:0] ALUSEL, ALUFLAG;
//assign ALUA = Top_DUT.ALU_DUT.A;
//assign ALUB = Top_DUT.ALU_DUT.B;
//assign ALUOUT = Top_DUT.ALU_DUT.Out;
//assign ALUSEL = Top_DUT.ALU_DUT.Sel;
//assign ALUFLAG = Top_DUT.ALU_DUT.Flag;

// CONCATENATOR
//wire[7:0] CONCA, CONCB, CONCC;
//wire[3:0] CONCD, CONCE;
//wire[31:0] CONCOUT;
//assign CONCA = Top_DUT.Concatenator_DUT.InA;
//assign CONCB = Top_DUT.Concatenator_DUT.InB;
//assign CONCC = Top_DUT.Concatenator_DUT.InC;
//assign CONCD = Top_DUT.Concatenator_DUT.InD;
//assign CONCE = Top_DUT.Concatenator_DUT.InE;
//assign CONCOUT = Top_DUT.Concatenator_DUT.out;

// MUX M4 32BIT
//wire[31:0] MUXMA, MUXMB, MUXMOUT;
//wire MUXMSEL;
//assign MUXMA = Top_DUT.Mux32Bit_DUT.A;
//assign MUXMB = Top_DUT.Mux32Bit_DUT.B;
//assign MUXMOUT = Top_DUT.Mux32Bit_DUT.Out;
//assign MUXMSEL = Top_DUT.Mux32Bit_DUT.Sel;

// SERIAL TRANSCIEVER
//wire[31:0] STDIN, STDATA;
//wire STSAMPLE, STSTARTTX, STRESET, STCLK, STCLKTX, STTXDONE, STTXBUSY; 
//wire [3:0] STDOUT;
//assign STDIN = Top_DUT.SerialTransciever_DUT.DataIn;
//assign STSAMPLE = Top_DUT.SerialTransciever_DUT.Sample;
//assign STSTARTTX = Top_DUT.SerialTransciever_DUT.StartTx;
//assign STRESET = Top_DUT.SerialTransciever_DUT.Reset;
//assign STCLK = Top_DUT.SerialTransciever_DUT.Clk;
//assign STCLKTX = Top_DUT.SerialTransciever_DUT.ClkTx;
//assign STTXDONE = Top_DUT.SerialTransciever_DUT.TxDone;
//assign STTXBUSY = Top_DUT.SerialTransciever_DUT.TxBusy;
//assign STDOUT = Top_DUT.SerialTransciever_DUT.Dout;
//assign STDATA = Top_DUT.SerialTransciever_DUT.data;
//assign STTXSTART = Top_DUT.SerialTransciever_DUT.TxStart;

// MEMORY
//wire[31:0] MEMDIN, MEMDOUT;
//wire[7:0] MEMADDR;
//wire MEMRW, MEMVALID, MEMRESET, MEMCLK;
//assign MEMDIN = Top_DUT.Memory_DUT.Din;
//assign MEMADDR = Top_DUT.Memory_DUT.Addr;
//assign MEMRW = Top_DUT.Memory_DUT.R_W;
//assign MEMVALID = Top_DUT.Memory_DUT.Valid;
//assign MEMRESET = Top_DUT.Memory_DUT.Reset;
//assign MEMCLK = Top_DUT.Memory_DUT.Clk;
//assign MEMDOUT = Top_DUT.Memory_DUT.Dout;

////FIRST 5 ADDRESSES OF THE MEMORY

//wire [31:0] MEMADDRESSES [0:4];
//assign MEMADDRESSES[0] = Top_DUT.Memory_DUT.Mem[0];
//assign MEMADDRESSES[1] = Top_DUT.Memory_DUT.Mem[1];
//assign MEMADDRESSES[2] = Top_DUT.Memory_DUT.Mem[2];
//assign MEMADDRESSES[3] = Top_DUT.Memory_DUT.Mem[3];
//assign MEMADDRESSES[4] = Top_DUT.Memory_DUT.Mem[4];

// CONTROLLER
//wire CONTACTIVE, CONTMODE, CONTVALID, CONTRW, CONTRESET, CONTCLK, CONTTXDONE, CONTACCESSMEM, CONTRWMEM, CONTSAMPLEDATA, CONTTXDATA, CONTBUSY;
//wire [1:0] CONTSTATE, CONTNEXTSTATE;
//assign CONTACTIVE = Top_DUT.Controller_DUT.Active;
//assign CONTMODE = Top_DUT.Controller_DUT.Mode;
//assign CONTVALID = Top_DUT.Controller_DUT.ValidCmd;
//assign CONTRW = Top_DUT.Controller_DUT.RW;
//assign CONTRESET = Top_DUT.Controller_DUT.Reset;
//assign CONTCLK = Top_DUT.Controller_DUT.Clk;
//assign CONTTXDONE = Top_DUT.Controller_DUT.TxDone;
//assign CONTACCESSMEM = Top_DUT.Controller_DUT.AccessMem;
//assign CONTRWMEM = Top_DUT.Controller_DUT.RWMem;
//assign CONTSAMPLEDATA = Top_DUT.Controller_DUT.SampleData;
//assign CONTTXDATA = Top_DUT.Controller_DUT.TxData;
//assign CONTBUSY = Top_DUT.Controller_DUT.Busy;
//assign CONTSTATE = Top_DUT.Controller_DUT.cs;
//assign CONTNEXTSTATE = Top_DUT.Controller_DUT.ns;
//DEC INPUT KEY
//assign DIKINPUTKEY = Top_DUT.InputKey_DUT.InputKey;
//assign DIKVALIDCMD = Top_DUT.InputKey_DUT.ValidCmd;
//assign DIKRESET = Top_DUT.InputKey_DUT.Reset;
//assign DIKCLK = Top_DUT.InputKey_DUT.Clk;
//assign DIKACTIVE = Top_DUT.InputKey_DUT.Active;
//assign DIKMODE = Top_DUT.InputKey_DUT.Mode;



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
        ConfigDiv <= 1'b0; 
    #7
        Reset <= 1'b0;
        ValidCmd <= 1'b1;
        ConfigDiv <= 1'b1;
        InputKey <= 1'b1;
    #10
        InputKey <= 1'b0;
        ConfigDiv <= 1'b0;
    #10
        InputKey <= 1'b1;
    #10
        InputKey <= 1'b0;
    #30
        ValidCmd <= 1'b0;
    #100
        InputKey <= 1'b1;
    #300
        RWMem <= 1'b1;
        Addr <= 8'h00;
        ValidCmd <= 1'b1;
    #20
        InA <= 8'hAB; 
        InB <= 8'h55;
        Sel <= 4'h0;
        Addr <= 8'h01;
    #10
        InA <= 8'hFF; 
        InB <= 8'hC0;
        Sel <= 4'h1;
        Addr <= 8'h02;
    #10
        RWMem <= 1'b0;
        ValidCmd <= 1'b0;
    #10
        ValidCmd <= 1'b1;
    #50
        ValidCmd <= 1'b0;        
    #400    
        $finish;
end

endmodule