
module testbench_fig_1;
  reg A_test, B_test, C_test;
  wire out_test;
  
   

  fig_1 test_fig(
    .A(A_test),
    .B(B_test),
    .C(C_test),
    .out(out_test));
  
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
    #5
      $finish;
  end
endmodule
    
