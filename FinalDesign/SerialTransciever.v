module SerialTransciever #(parameter WIDTH = 1)(
input [31:0] DataIn,
input Sample, StartTx, Reset, Clk, ClkTx,
output reg TxDone, TxBusy, 
output reg [WIDTH-1:0] Dout);

reg TxStart;
reg [31:0] data;
always@(posedge Clk or posedge Reset)
begin
    if(Reset)
    begin
        TxDone <= 1'b0;
        TxBusy <= 1'b0;
        Dout <= {WIDTH{1'b0}};
    end
    if(Sample && !StartTx)
    begin
        data <= DataIn;
        TxStart <= 1'b0;
    end
    else if(!Sample && StartTx)
    begin
        TxStart <= 1'b1;
        TxBusy <= 1'b1;
    end
end

always@(posedge ClkTx)
begin
    if(TxStart)
    begin
        if(data != 0)
        begin
          Dout <= data[31:31-WIDTH]; // WHY IT ALWAYS OUTPUTS THE VALUE OF DATA AFTER THE SHIFT??
            data <= data << WIDTH;
        end
        else
        begin
            TxDone <= 1'b1;
            TxBusy <= 1'b0;
        end
    end
end

endmodule
