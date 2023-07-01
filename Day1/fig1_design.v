module fig_1(input A, input B, input C, output out);
  wire outNand, outNeg, outAnd;
  
  nand(outNand, A, B);
  not(outNeg, C);
  and(outAnd,outNand, B, outNeg);
  
  assign out = outAnd;
  
  
endmodule
