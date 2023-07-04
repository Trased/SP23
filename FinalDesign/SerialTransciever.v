module SerialTransciever #(parameter WIDTH = 1)(
input [31:0] DataIn,
input Sample, StartTx, Reset, Clk, ClkT,
output TxDone, TxBusy, 
output [WIDTH-1:0] Dout);

// Daca am ClkTX , functionez dupa ClkTx, in caz contrat, fac dupa Clk!!!

endmodule
