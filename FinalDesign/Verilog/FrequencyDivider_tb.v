module tb;
reg [31:0] Din;
reg ConfigDiv, Reset, Clk, Enable;
wire ClkOut;

FrequencyDivider DUT(
                    .Din(Din),
                    .ConfigDiv(ConfigDiv),
                    .Reset(Reset),
                    .Clk(Clk),
                    .Enable(Enable),
                    .ClkOut(ClkOut));
 wire [31:0] T, counter;
 assign T = DUT.T;
 assign counter = DUT.counter;
 
 initial
 begin
    #0 Clk <= 1'b0;
    forever #5 Clk <= ~Clk;
 end                 

initial
begin
    #0
        Din <= 32'h00000005;
        ConfigDiv <= 1'b0;
        Reset <= 1'b1;
        Enable <= 1'b0;
    #9
        ConfigDiv <= 1'b1;
        Reset <= 1'b0;
    #20
        ConfigDiv <= 1'b0;
        Enable <= 1'b1;
    #300
        $finish;
end
endmodule
