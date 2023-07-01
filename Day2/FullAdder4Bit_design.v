module task2_fullAdderOneBit(A,B,Cin,S,Cout);
  input A, B, Cin;
  output S, Cout;
  wire outXorAB, outNandAB, outNandABCin;
  
  xor(outXorAB, A,B);
  nand(outNandAB, B,A);
  xor(S, outXorAB,Cin);
  nand(outNandABCin, outXorAB,Cin);
  nand(Cout, outNandABCin, outNandAB);
  
endmodule

module task2_fullAdder(A, B, Cin, S, Cout);
  input [3:0] A, B;
  input Cin;
  output [3:0] S;
  output Cout;
  wire carryOne, carryTwo, carryThree;
  
  task2_fullAdderOneBit firstDigit(A[0], B[0], Cin, S[0], carryOne);
  task2_fullAdderOneBit secondDigit(A[1], B[1], carryOne, S[1], carryTwo);
  task2_fullAdderOneBit thirdDigit(A[2], B[2], carryTwo, S[2], carryThree);
  task2_fullAdderOneBit fourthDigit(A[3], B[3], carryThree, S[3], Cout);
  
endmodule
