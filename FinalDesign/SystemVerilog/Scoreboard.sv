class scoreboard;
    mailbox ik_scb_mbx, do_scb_mbx, int_scb_mbx;
    reg [31:0] IntMem [10];
    reg [1:0] cs = 2'b00;
    reg [3:0] Flag = 4'b0000;
    reg [7:0] tempMem;
    reg [31:0] tempOut;
    reg [3:0] cnt = 4'b0000;
    task run();
       fork
        InputKey_Scoreboard();
        Internal_save();
        DataOut_scoreboard();
       join_none 
    endtask
    
    task InputKey_Scoreboard();
        forever begin
            begin
            Top_item item = new;
            ik_scb_mbx.get(item);
            if(!item.CalcActive)
            begin
               case({cs, item.InputKey})
               3'b00_1: cs <= 2'b01;
               3'b01_0: cs <= 2'b10;
               3'b10_1: cs <= 2'b11;
               3'b11_0: begin cs <= 2'b00; $display("T = %0t ns: [Scoreboard] PASS! Correct sequence of the input key!", $time); end
               default: begin cs <= 2'b00; $display("T = %0t ns: [Scoreboard] FAIL! Wrong sequence of the input key!", $time);  end 
               endcase   
            end
            end
        end
    endtask    
    task Internal_save();
        forever begin
        begin
            Top_item item = new;
            int_scb_mbx.get(item);
            if(item.CalcActive)
            begin
                Flag = 4'b0000;
                case(item.Sel)
                    4'b0000: {Flag[1:1], tempMem} = item.InA + item.InB;
                    4'b0001: {Flag[3:3], tempMem} = item.InA - item.InB;
                    default: tempMem = 8'h00; // Ar trebui de implementat toata functionalitatea ALU
                                              // Pentru simplicitate am lasat doar "+" si "-"
                endcase
                if(tempMem == 0)
                begin
                    Flag[0:0] = 1'b1;
                end
                if(!item.RWMem && !item.Busy)
                begin
                    IntMem[9] = {Flag, item.Sel, tempMem, item.InB, item.InA};   
                end
                else if(item.RWMem && item.Busy)
                begin
                    IntMem[item.Addr] = {Flag, item.Sel, tempMem, item.InB, item.InA};
                end
            end      
        end
        end
    endtask   
    task DataOut_scoreboard();
        forever begin
        begin
            Top_item item = new;
            do_scb_mbx.get(item);
            if(item.DOutValid)
                begin
                    tempOut = {tempOut, item.Dout};
                    cnt = cnt+1;
                end
            if(cnt == 9)
                begin
                   cnt = 0;
                   if(item.CalcMode)
                       begin
                           if(IntMem[item.Addr]  == tempOut)
                               begin
                                    $display("T = %0t ns: [Scoreboard] PASS! The calculator gave the correct output!", $time); 
                               end
                           else
                               begin
                                    $display("T = %0t ns: [Scoreboard] FAIL! The calculator gave the wrong output! expected: 0x%0h, actual: 0x%0h", $time, IntMem[item.Addr], tempOut);
                               end
                       end
                    else
                        begin
                           if( IntMem[9] == tempOut) 
                               begin
                                    $display("T = %0t ns: [Scoreboard] PASS! The calculator gave the correct output!", $time); 
                               end
                           else
                               begin
                                    $display("T = %0t ns: [Scoreboard] FAIL! The calculator gave the wrong output! expected: 0x%0h, actual: 0x%0h", $time, IntMem[9], tempOut);                  
                               end
                        end
                end
        end            
        end
    endtask   
endclass