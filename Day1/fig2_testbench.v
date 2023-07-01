module testbench_fig;
  reg A_test, B_test, C_test;
  wire out_test;
   
  // Variabile interne create pentru debug (figura 2)
  // wire NotA, NandBC, AndA, NotC,AndBC, NotAndA,Xor, out;
  
   
  fig_2 test_fig(
    .A(A_test),
    .B(B_test),
    .C(C_test),
    .out(out_test));
  
  /*    Variabile interne initializate pentru debug (figura 2)
  assign NotA = test_fig.outNotA;
  assign NandBC = test_fig.outNandBC;
  assign AndA = test_fig.outAndA;
  assign NotC = test_fig.outNotC;
  assign AndBC = test_fig.outAndBC;
  assign NotAndA = test_fig.outNotAndA;
  assign Xor = test_fig.outXor;
  assign out = test_fig.out;
  */
  
  initial
  begin
    #0 
    	A_test = 1'b0;
    	B_test = 1'b0;
    	C_test = 1'b0;
    
    #5
    	C_test = 1'b1;  
    #5 
    	B_test = 1'b1;
    	C_test = 1'b0;
    
    #5
    	C_test = 1'b1;
    #5 
    	A_test = 1'b1;
    	B_test = 1'b0;
    	C_test = 1'b0;
    #5
    	C_test = 1'b1;  
    #5 
    	B_test = 1'b1;
    	C_test = 1'b0;
    
    #5
    	C_test = 1'b1;
  
    
  end
endmodule
    
