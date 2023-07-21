`include "Environment.sv"
module TopModule_tb;
reg InputKey, ValidCmd, RWMem, ConfigDiv, Reset, Clk;
reg[7:0] Addr, InA, InB;
reg[3:0] Sel;
reg[31:0] Din;
wire CalcActive, CalcMode, Busy, DOutValid, ClkTx;
wire [3:0] DataOut;


tb_inf _inf(.Clk(Clk));
env e0 = new();
initial
begin
       e0.m0.vif = _inf;
       e0.run();
end


//STRICT PENTRU VIVADO
assign InputKey = _inf.InputKey;
assign ValidCmd = _inf.ValidCmd;
assign RWMem = _inf.RWMem; 
assign ConfigDiv = _inf.ConfigDiv; 
assign Reset = _inf.Reset; 
assign Addr = _inf.Addr;
assign InA = _inf.InA;
assign InB = _inf.InB;
assign Sel = _inf.Sel;
assign Din = _inf.Din;
assign CalcActive = _inf.CalcActive;
assign CalcMode = _inf.CalcMode;
assign Busy = _inf.Busy;
assign DOutValid = _inf.DOutValid;
assign ClkTx = _inf.ClkTx;
assign DataOut = _inf.DataOut;

TopModule Top_DUT(
        .InputKey(_inf.InputKey),
        .ValidCmd(_inf.ValidCmd),
        .RWMem(_inf.RWMem),
        .ConfigDiv(_inf.ConfigDiv),
        .Reset(_inf.Reset),
        .Clk(_inf.Clk),
        .Addr(_inf.Addr),
        .InA(_inf.InA),
        .InB(_inf.InB),
        .Sel(_inf.Sel),
        .DIn(_inf.Din),
        .CalcActive(_inf.CalcActive),
        .CalcMode(_inf.CalcMode),
        .Busy(_inf.Busy),
        .DOutValid(_inf.DOutValid),
        .DataOut(_inf.DataOut),
        .ClkTx(_inf.ClkTx)
    );

initial begin
    #0 Clk = 1'b0;
    forever #5 Clk = ~Clk; 
end
initial begin
    #0
        _inf.InputKey <= 1'b0;
        _inf.ValidCmd <= 1'b0;
        _inf.RWMem <= 1'b0; 
        _inf.ConfigDiv <= 1'b0;
        _inf.Reset <= 1'b1;
        _inf.Addr <= 8'h00;
        _inf.InA <= 8'hAB; 
        _inf.InB <= 8'h54;
        _inf.Sel <= 4'h0;
        _inf.Din <= 32'h0000_0001; 
        _inf.ConfigDiv <= 1'b0; 
    #7
        _inf.Reset <= 1'b0;
        _inf.ValidCmd <= 1'b1;
        _inf.ConfigDiv <= 1'b1;
        _inf.InputKey <= 1'b1;
    #10
        _inf.InputKey <= 1'b0;
        _inf.ConfigDiv <= 1'b0;
    #10
        _inf.InputKey <= 1'b1;
    #10
        _inf.InputKey <= 1'b0;
    #30
        _inf.ValidCmd <= 1'b0;
    #100
        _inf.InputKey <= 1'b1;
    #300
        _inf.RWMem <= 1'b1;
        _inf.Addr <= 8'h00;
        _inf.ValidCmd <= 1'b1;
    #20
        _inf.InA <= 8'hAB; 
        _inf.InB <= 8'h55;
        _inf.Sel <= 4'h0;
        _inf.Addr <= 8'h01;
    #10
        _inf.InA <= 8'hFF; 
        _inf.InB <= 8'hC0;
        _inf.Sel <= 4'h1;
        _inf.Addr <= 8'h02;
    #10
        _inf.RWMem <= 1'b0;
        _inf.ValidCmd <= 1'b0;
    #10
        _inf.ValidCmd <= 1'b1;
    #50
        _inf.ValidCmd <= 1'b0;        
    #400    
        $finish;
end
endmodule