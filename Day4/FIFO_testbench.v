module FIFO_tb;
reg [1:0] Opcode;
reg [31:0] Din;
reg Reset, Clk;
wire [31:0] Dout;
wire FifoFull, FifoEmpty, Overflow, Underflow;


task3_FIFO #(4) FIFO_DUT(
                        .Opcode(Opcode),
                        .Din(Din),
                        .Reset(Reset),
                        .Clk(Clk),
                        .Dout(Dout),
                        .FifoFull(FifoFull),
                        .FifoEmpty(FifoEmpty),
                        .Overflow(Overflow),
                        .Underflow(Underflow));
                        
wire [31:0] TheMem[3:0];
wire [1:0] wrpos;
wire [1:0] rdpos;
assign TheMem[0] = FIFO_DUT.Mem[0];
assign TheMem[1] = FIFO_DUT.Mem[1];
assign TheMem[2] = FIFO_DUT.Mem[2];
assign TheMem[3] = FIFO_DUT.Mem[3];
assign wrpos = FIFO_DUT.wrpos;
assign rdpos = FIFO_DUT.rdpos;
  
initial
begin
    #0 Clk <= 1'b0;
    forever #5 Clk <= ~Clk;
end
initial
begin
    #0  Opcode <= 2'b00;
        Din <= 32'h0000;
        Reset <= 1'b1;
    #2
        Reset <= 1'b0;
    #8    
        Din <= 32'hABCDEF12;
        Opcode <= 2'b01;
    #10
        Din <= 32'hFFFFFFFF;
        Opcode <= 2'b10;
    #20
        Opcode <= 2'b01;
    #10
        Din <= 32'hAAAAAAAA;
    #10
        Din <= 32'hBBBBBBBB;
    #10
        Din <= 32'hCCCCCCCC;
    #10
        Din <= 32'hDDDDDDDD;
    #10
        Reset <= 1'b1;
        Din <= 32'hEEEEEEEE;
    #10
        Reset <= 1'b0;
        Din <= 32'hFFFFFFFF;
    #20
        $finish;
end
endmodule
