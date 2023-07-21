module DecInputKey_TB;

reg InputKey;
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
    InputKey <= 1'b0;
    ValidCmd <= 1'b0;
    Reset <= 1'b1;
  #10
    Reset <= 1'b0;
    InputKey <= 5'b1;
    ValidCmd <= 1'b1;
  #10
    InputKey <= 1'b0;
  #10
    InputKey <= 1'b1;
  #10
    InputKey <= 1'b0;
  #10
    InputKey <= 1'b1;
  #10
    ValidCmd <= 1'b0;
  #22
    Reset <= 1'b1;
  #8
    Reset <= 1'b0;
    ValidCmd <= 1'b1;
    InputKey <= 1'b0;
  #10
    InputKey <= 1'b1;
  #10
    InputKey <= 1'b1;
  #10
    InputKey <= 1'b0;
  #10
    InputKey <= 1'b1;
  #10
    InputKey <= 1'b0;
  #10
    InputKey <= 1'b1;
  #10
    InputKey <= 1'b0;
  #10
    InputKey <= 1'b1;
  #30
    $finish;
end

endmodule
