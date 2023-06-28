module RegisterPISO #(parameter Width = 2) 
                    (input Clk,
                     input Reset,
                     input Load,
                     input Tx,
                     input [Width-1:0] ParalelIn,
                     output reg SerialOut); 

integer RegBankPos;
integer TxOut;
reg [Width-1:0] RegBank;

always @(posedge Clk)
begin
    if( Reset)
    begin
        for(RegBankPos = 0; RegBankPos < Width; RegBankPos = RegBankPos + 1)
            begin
                RegBank[RegBankPos] <= 1'b0;
            end
    end
    if(TxOut == 0)
    begin
        if(Load)
        begin
            RegBank <= ParalelIn;
        end
        else if(Tx)
        begin
            TxOut = Width-1;
            SerialOut <= RegBank[Width-1];
        end
    end
    else
    begin
        RegBank <= {RegBank[Width-2:0], 0};
        SerialOut <= RegBank[Width-1];
        TxOut = TxOut - 1;
    end
end


endmodule
