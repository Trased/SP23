module RW_flow(
input Active, Mode, ValidCmd, RW, Reset, Clk, TxDone,
output reg AccessMem, RWMem, SampleData, TxData, Busy);

reg [1:0] cs = 2'b00, ns;
reg [1:0] rwFlag = 2'b00;

always@(cs or ns)
    cs <= ns;

always@(posedge Clk or posedge Reset)
begin
    if(Reset)
        begin
            AccessMem <= 1'b0;
            RWMem <= 1'b0;
            SampleData <= 1'b0;
            TxData <= 1'b0;
            Busy <= 1'b0;
            rwFlag <= 2'b00;
            ns <= 2'b00;
        end
    else if (Mode == 1'b1 && rwFlag != 2'b10)
        begin
            rwFlag <= 2'b01;
            casex({cs, ValidCmd, Active, Mode, RW, TxDone})
              7'b00_1_1_1_0_x: {ns, AccessMem, RWMem, Busy} <= 5'b01_1_0_1;
              7'b00_1_1_1_1_x: {ns, AccessMem, RWMem, TxData, Busy} <= 6'b11_1_1_1_1;
              7'b01_x_1_1_x_0: {ns,SampleData, AccessMem} <= 4'b10_1_0;
              7'b10_x_1_x_x_0: {ns,TxData,SampleData} <= 4'b11_1_0;
              7'b11_x_1_x_x_x: if (TxDone) begin {ns, Busy,TxData, AccessMem, RWMem} <= 6'b00_0_0_0_0; end
              default: {ns, AccessMem, RWMem, SampleData, TxData, Busy, rwFlag} <= 9'b00_0_0_0_0_0_00;
            endcase
        end
   else if (Mode == 1'b0 && rwFlag != 2'b01)
       begin
            rwFlag <= 2'b10;
            casex({cs, ValidCmd, Active, Mode,TxDone})
              6'b00_1_1_0_x: {ns, SampleData, Busy} <= 4'b01_1_1;
              6'b01_x_1_0_0: {ns, SampleData, TxData} <= 4'b10_0_1;
              6'b10_x_1_x_x: if(TxDone) begin {ns, Busy,TxData} <= 4'b00_0_0;  end           
              default: {AccessMem, RWMem, Busy, rwFlag} <= 7'b00_0_0_0_00;
            endcase
       end
end
endmodule
