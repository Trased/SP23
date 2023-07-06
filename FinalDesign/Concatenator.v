module Concatenator(InA, InB, InC, InD, InE, out);
  input [7:0] InA, InB, InC;
  input [3:0] InD, InE;
  output [31:0] out;
  
  assign out = {InE, InD, InC, InB, InA};
  
endmodule