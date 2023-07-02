module Memory_Testbench;

  // Parameters
  parameter WIDTH = 8;
  parameter DinLength = 32;

  // Inputs
  reg [DinLength-1:0] Din;
  reg [WIDTH-1:0] Addr;
  reg R_W;
  reg Valid;
  reg Reset;
  reg Clk;

  // Outputs
  wire [DinLength-1:0] Dout;

  // Instantiate the module
  Memory #(WIDTH, DinLength) dut (
    .Din(Din),
    .Addr(Addr),
    .R_W(R_W),
    .Valid(Valid),
    .Reset(Reset),
    .Clk(Clk),
    .Dout(Dout)
  );
  
  // Clock generation
  initial
  begin
    Clk <= 1'b0;
    forever #5 Clk = ~Clk;
  end
  // Reset initialization

  // Test cases
  initial begin
    // Test case 1: Write and read back data
    Reset = 1'b1;
    Din = 32'hAABBCCDD;
    Addr = 2'b00;
    R_W = 1'b1;
    Valid = 1'b1;
    #10;
    Reset = 1'b0;
    #20;
    R_W = 1'b0;
    #30;
    // Test case 2: Write to multiple addresses and read back
    Din = 32'h11223344;
    Addr = 2'b01;
    R_W = 1'b1;
    Valid = 1'b1;
    #10;
    Addr = 2'b10;
    Din = 32'h55667788;
    #10
    Addr = 2'b11;
    Din = 32'h99AABBCC;
    #10;
    R_W = 1'b0;
    #10
    Addr = 2'b10;
    #10
    Addr = 2'b01;
    #10;
    // Test case 3: Read from an unpopulated address
    Addr = 3'b100;
    R_W = 1'b0;
    Valid = 1'b1;
    #10;
    // Test case 4: Perform a reset
    Reset = 1'b1;
    #10;
    Reset = 1'b0;
    #10;
    // End simulation
    $finish;
  end

endmodule
