`include "Interface.sv"
`include "TransactionObject.sv"

class monitor; 
    virtual tb_inf vif;
    mailbox ik_scb_mbx, do_scb_mbx, int_scb_mbx;
    task run();
        $display("T = %0t ns: [Monitor] starting... ", $time);   
        fork
            general_monitor();
            keyinput_monitor();
            dataOut_monitor();
        join_none
    endtask  
    task keyinput_monitor();
        forever begin
            @(vif.InputKey)
              begin
                    Top_item item = new;
                    item.Dout = vif.DataOut;
                    item.Din = vif.Din;
                    item.Addr = vif.Addr;
                    item.InA = vif.InA;
                    item.InB = vif.InB;
                    item.Sel = vif.Sel;
                    item.InputKey = vif.InputKey;
                    item.ValidCmd = vif.ValidCmd;
                    item.RWMem = vif.RWMem; 
                    item.ConfigDiv = vif.ConfigDiv;
                    item.Reset = vif.Reset;
                    item.CalcActive = vif.CalcActive;
                    item.CalcMode = vif.CalcMode;
                    item.Busy = vif.Busy;
                    item.DOutValid = vif.DOutValid;
                    item.print("Monitor InputKey");
                    ik_scb_mbx.put(item);
                end
            end           
    endtask  
    task dataOut_monitor();
        forever begin
            @(posedge vif.ClkTx)
              if(vif.DOutValid == 1'b1)
              begin
                    Top_item item = new;
                    item.Dout = vif.DataOut;
                    item.Din = vif.Din;
                    item.Addr = vif.Addr;
                    item.InA = vif.InA;
                    item.InB = vif.InB;
                    item.Sel = vif.Sel;
                    item.InputKey = vif.InputKey;
                    item.ValidCmd = vif.ValidCmd;
                    item.RWMem = vif.RWMem; 
                    item.ConfigDiv = vif.ConfigDiv;
                    item.Reset = vif.Reset;
                    item.CalcActive = vif.CalcActive;
                    item.CalcMode = vif.CalcMode;
                    item.Busy = vif.Busy;
                    item.DOutValid = vif.DOutValid;
                    item.print("Monitor DataOut");
                    do_scb_mbx.put(item);
                end
            end           
    endtask  
    task general_monitor();
         forever begin
            @(vif.ValidCmd, vif.RWMem, vif.ConfigDiv, vif.Reset, vif.Addr, vif.InA, vif.InB, vif.Sel, vif.Din, vif.CalcActive, vif.CalcMode, vif.Busy);
                    begin
                    Top_item item = new;
                    item.Dout = vif.DataOut;
                    item.Din = vif.Din;
                    item.Addr = vif.Addr;
                    item.InA = vif.InA;
                    item.InB = vif.InB;
                    item.Sel = vif.Sel;
                    item.InputKey = vif.InputKey;
                    item.ValidCmd = vif.ValidCmd;
                    item.RWMem = vif.RWMem; 
                    item.ConfigDiv = vif.ConfigDiv;
                    item.Reset = vif.Reset;
                    item.CalcActive = vif.CalcActive;
                    item.CalcMode = vif.CalcMode;
                    item.Busy = vif.Busy;
                    item.DOutValid = vif.DOutValid;
                    item.print("Monitor general");
                    int_scb_mbx.put(item);
                end
            end
       endtask
endclass