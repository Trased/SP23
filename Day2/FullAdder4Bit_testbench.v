module task2_sumator_testbench;
  reg [3:0] A, B;
  reg Cin;
  wire [3:0] S;
  wire Cout;
  
  task2_fullAdder fullAdder_DUT(
    .A(A),
    .B(B),
    .Cin(Cin),
    .S(S),
    .Cout(Cout));
  
  initial
    begin
      #0
      	A = 4'b0000;
      	B = 4'b0000;
      	Cin = 1'b0;     
      #5
      	Cin = 1'b1;
      	
      #5
      	B = 4'b1010;
      #5
      	A = 4'b0101;
      #5
      	Cin = 1'b0;
      #5
      	B = 4'b1111;
      #5
      	A = 4'b1111;
      #5
      	Cin = 1'b1;
      	
      #10
        $finish;	
    end
endmodule
