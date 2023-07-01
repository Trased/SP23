module task3_FIFO #(parameter N = 4)
  (input [1:0] Opcode,
  input [31:0] Din,
  input Reset, Clk,
  output reg [31:0] Dout,
  output reg FifoFull, FifoEmpty, Overflow, Underflow);
  
  integer res;
  reg [31:0] Mem [N-1:0];
  reg [N-1:0] wrpos = N-1; // Write Position
  reg [N-1:0] rdpos = N-1; // Read Position
  reg memFull, memEmpty;
  
  always@(posedge Clk or posedge Reset)
  begin
    FifoFull <= 1'b0;
    FifoEmpty <= 1'b0;
    Overflow <= 1'b0;
    Underflow <= 1'b0;
    Dout <= 32'hXXXX;
    if(Reset)
    begin
        for(res = 0; res < N; res = res+1)
        begin
            Mem[res] <= 32'bXXXX;
        end
    end
    else
    begin  
    case (Opcode)
        2'b01: 
        begin
            if (memFull)
            begin
                Overflow <= 1'b1;
            end
            else
            begin
                if(^Mem[wrpos] === 1'bx)
                begin
                    memEmpty <= 1'b0;
                    Mem[wrpos] <= Din;
                    wrpos <= wrpos - 1;
                end
                else 
                begin
                    FifoFull <= 1'b1;
                    memFull <= 1'b1;
                end
                if(wrpos == 0)
                   wrpos <= N-1;              
            end
        end
        2'b10:
        begin
            if (memEmpty)
                Underflow <= 1'b1;
            else
            begin
                if(^Mem[rdpos] === 1'bx)
                begin
                    FifoEmpty <= 1'b1;
                    memEmpty <= 1'b1;
                end
                else
                begin
                    memFull <= 1'b0;
                    Dout <= Mem[rdpos];
                    Mem[rdpos] <= 32'bXXXX;
                    rdpos <= rdpos - 1;
                end
                if(rdpos == 0)
                    rdpos <= N-1;
            end
        end
    endcase
  end
 end
endmodule
