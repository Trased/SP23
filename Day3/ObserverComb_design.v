module ObserverComb(Enable, In0, In1, In2, In3, Out0Mux, Out1, Out2);
input Enable, In0, In1, In2, In3;
output Out0Mux, Out1, Out2;

  
assign Out0Mux = Enable & ((In0 & ~In1 & In3) | (~In0 & ~In1 & In2));
assign Out1 = Enable & ((In0 & ~In1 & (In2 ^ In3)) | (In1 & ~In2 & (In0 ^ In3)) + (~In0 & In2 & (In1 ^ In3))); 
assign Out2 = Enable & ((In0 & In3 & (In1 ^ In2)) | (In1 & In2 & (In0 ^ In3)));

endmodule
