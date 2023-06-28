

module PISO_testbench;
reg Clk;
reg Reset;
reg Load;
reg Tx;
reg [3:0] ParalelIn;
wire SerialOut;

RegisterPISO #(4) PISO_DUT(
                    .Clk(Clk),
                    .Reset(Reset),
                    .Loat(Load),
                    .Tx(Tx),
                    .ParalelIn(ParalelIn),
                    .SerialOut(SerialOut));


initial
begin
    forever #5 Clk  = ~Clk;
end

initial
begin
    #0  Reset = 1'b0;
        Load = 1'b0;



  // TO BE FINISHED. ALL TESTCASES WHEN TX IS ALREADY RUNNING AND I DO LOAD.
  // F 0 A B C 5 7 VALUES FOR PARALELIN;

end
endmodule
