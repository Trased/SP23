module DecInputKey_TB;

reg [4:0] InputKey;
reg ValidCmd;
reg Reset;
reg Clk;
wire Active;
wire Mode;

DecInputKey dut (
    .InputKey(InputKey),
    .ValidCmd(ValidCmd),
    .Reset(Reset),
    .Clk(Clk),
    .Active(Active),
    .Mode(Mode)
);
wire [1:0] cs,ns;
assign cs = dut.cs;
assign ns = dut.ns;

initial
begin
    #0 Clk <= 1'b0;
    forever #5 Clk <= ~Clk;
end

initial
begin
  #0
    InputKey <= 5'b00000;
    ValidCmd <= 1'b0;
    Reset <= 1'b1;
  #10
    Reset <= 1'b0;
    InputKey <= 5'b10101;
    ValidCmd <= 1'b1;
  #50
    ValidCmd <= 1'b0;
  #2
    Reset <= 1'b1;
  #8
    Reset <= 1'b0;
    ValidCmd <= 1'b1;
    InputKey <= 5'b00001;
  #50
    InputKey <= 5'b00101;
  #30
    InputKey <= 5'b10000;
  #10
    $finish;
end

endmodule
