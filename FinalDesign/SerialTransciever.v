module SerialTransciever #(parameter WIDTH = 32)(
input [WIDTH-1:0] DataIn,
input Sample, StartTx, Reset, Clk, ClkTx,
output reg TxDone, TxBusy, 
output reg Dout);

reg TxStart;
reg [WIDTH-1:0] data;
reg [5:0] cnt;
always@(posedge Clk or posedge Reset)
begin
    if(Reset)
    begin
        TxDone <= 1'b0;
        TxBusy <= 1'b0;
        Dout <= {WIDTH{1'b0}};
        cnt <= 0;
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
        if(cnt < 32)
        begin
            Dout <= data[WIDTH-1:WIDTH-1];
            data <= data << 1;
            cnt <= cnt + 1'b1; 
        end
        else
        begin
            Dout <= {WIDTH{1'b0}};
            TxDone <= 1'b1;
            TxBusy <= 1'b0;
        end
    end
end

endmodule
