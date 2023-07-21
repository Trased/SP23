interface tb_inf(input bit Clk);
  logic InputKey, ValidCmd, RWMem, ConfigDiv, Reset;
  logic [7:0] Addr, InA, InB;
  logic [3:0] Sel;
  logic [31:0] Din;
  logic CalcActive, CalcMode, Busy, DOutValid, ClkTx;
  logic [3:0] DataOut;
  
  modport dut (input InputKey, ValidCmd, RWMem, ConfigDiv, Reset, Addr, InA, InB, Sel, Din, 
                output CalcActive, CalcMode, Busy, DOutValid, ClkTx, DataOut);
endinterface
