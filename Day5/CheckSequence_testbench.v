module Moore_tb;
reg [1:0] Din;
reg Reset;
reg Clk;
wire [1:0] Dout;

CheckSequence Moore_DUT(
                .Din(Din),
                .Reset(Reset),
                .Clk(Clk),
                .Dout(Dout));
      
initial
begin
    #0 Clk <= 1'b0;
    forever #5 Clk <= ~Clk;
end

initial
begin
    #0  Reset <= 1'b1;
        Din <= 2'b00;
    #10
        Reset <= 1'b0;
    #10
        Din <= 2'b10;
    #20
        Din <= 2'b00;
    #10
        Din <= 2'b10;
    #40
        Din <= 2'b11;
    #40
        Reset <= 1'b1;
    #10
        $finish;     
end

endmodule
