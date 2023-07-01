module task2_concatenator_testbench;
  reg [7:0] InA, InB, InC;
  reg [3:0] InD, InE;
  wire [31:0] out;
  
  task2_concatenator DUT_concatenator(
    .InA(InA),
    .InB(InB),
    .InC(InC),
    .InD(InD),
    .InE(InE),
    .out(out));
  
  initial
    begin 
   #0 InA = 8'b00000000;
      InB = 8'b00000000;
      InC = 8'b00000000;
      InD = 4'b0000;
      InE = 4'b0000;
      
   #5
      InA = 8'b10101010;
      InB = 8'b01010101;
      InC = 8'b11110000;
      InD = 4'b1010;
      InE = 4'b0101;
      
   #5
      InA = 8'b11111111;
      InB = 8'b11111111;
      InC = 8'b11111111;
      InD = 4'b1111;
      InE = 4'b1111;
      
   #5 $finish;
    end  
endmodule
