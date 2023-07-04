module Testbench;
reg [31:0] DataIn;
reg Sample, StartTx, Reset, Clk, ClkTx;
wire TxDone, TxBusy;
wire Dout;

SerialTransciever #(1) DUT(
                    .DataIn(DataIn),
                    .Sample(Sample),
                    .StartTx(StartTx),
                    .Reset(Reset),
                    .Clk(Clk),
                    .ClkTx(ClkTx),
                    .TxDone(TxDone),
                    .TxBusy(TxBusy),
                    .Dout(Dout));
 
wire [31:0] data;
assign data = DUT.data;
 
                    
initial
begin
    #0 Clk <= 1'b0;
    forever #5 Clk <= ~Clk;
end
initial
begin
    #0 ClkTx <= 1'b0;
    forever #10 ClkTx <= ~ClkTx;
end

initial
begin
    #0
        DataIn <= 32'h12345678;
        Sample <= 1'b0;
        StartTx <= 1'b0;
        Reset <= 1'b1;
   #20
        Reset <= 1'b0;
        Sample <= 1'b1;
   #20
        StartTx <= 1'b1;
   #20
        Sample <= 1'b0;
   #1000
        $finish;     
end

endmodule
