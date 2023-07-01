module fig_2(input A, input B, input C, output out);
  wire outNotA, outNandBC, outAndA, outNotC,outAndBC, outNotAndA,outXor, out;
  
  not(outNotA, A);
  nand(outNandBC, B,C);
  not(outNotC, outNandBC);
  and(outAndBC, outNandBC, B);
  and(outAndA, outAndBC, outNotA);
  not(outNotAndA, outAndA);
  xor(outXor, outAndBC, outNotC);
  or(out, outNotAndA, outXor);
  
  
endmodule
