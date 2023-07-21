module SerialTransciever #(parameter WIDTH = 4)(
input [31:0] DataIn,
input Sample, StartTx, Reset, Clk, ClkTx,
output reg TxDone, TxBusy, 
output reg [WIDTH-1:0] Dout);

reg TxStart;
reg [31:0] data;
reg [5:0] cnt;
always@(posedge Clk or posedge Reset)
begin
    if(Reset)
    begin
        TxDone <= 1'b0;
        TxBusy <= 1'b0;
        Dout <= {32{1'b0}};
        cnt <= 0;
    end
    if(Sample && !StartTx)
    begin
        data <= DataIn;
        TxStart <= 1'b0;
        TxDone <= 1'b0;
    end
    else if(!Sample && StartTx && !(^data === 1'bx))
    begin
        TxStart <= 1'b1;
        TxBusy <= 1'b1;
        TxDone <= 1'b0;
    end
     
end

always@(posedge ClkTx)
begin
    TxDone <= 1'b0;
    if(TxStart)
    begin
        if(cnt < 32)
        begin
            Dout <= data[31:32-WIDTH];
            data <= {data[31-WIDTH:0], {WIDTH{1'b0}}};
            cnt <= cnt + WIDTH; 
            TxDone <= 1'b0;
        end
        else
        begin
            data <= {31{1'bx}};
            Dout <= {31{1'b0}};
            TxDone <= 1'b1;
            TxStart <= 1'b0;
            TxBusy <= 1'b0;
            cnt <= 0;
        end
    end
end

endmodule