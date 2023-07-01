module comb_tb;
reg Enable, In0, In1, In2, In3;
wire Out0Mux, Out1, Out2;

ObserverComb Observer_DUT(
                    .Enable(Enable),
                    .In0(In0),
                    .In1(In1),
                    .In2(In2),
                    .In3(In3),
                    .Out0Mux(Out0Mux),
                    .Out1(Out1),
                    .Out2(Out2));
                   
initial
begin
    #0 
        Enable = 1'b0;
        In0 = 1'b0;
        In1 = 1'b0;
        In2 = 1'b0;
        In3 = 1'b0;       
    #5
        Enable  = 1'b1;  
    #5
        In3 = 1'b1;
    #5
        In2 = 1'b1;
        In3 = 1'b0;
    #5
        In3 = 1'b1;
    #5
        In1 = 1'b1;
  		In2 = 1'b0;
  		In3 = 1'b0;
    #5
        In3 = 1'b1;
    #5
        In2 = 1'b1;
        In3 = 1'b0;
    #5
        In3 = 1'b1;
  	#5
  		In0 = 1'b1;
  		In1 = 1'b0;
  		In2 = 1'b0;
  		In3 = 1'b0;
  	#5
        In3 = 1'b1;
    #5
        In2 = 1'b1;
        In3 = 1'b0;
    #5
        In3 = 1'b1;
    #5
        In1 = 1'b1;
  		In2 = 1'b0;
  		In3 = 1'b0;
    #5
        In3 = 1'b1;
    #5
        In2 = 1'b1;
        In3 = 1'b0;
    #5
        In3 = 1'b1;
    #10
        $finish;  
end

endmodule
