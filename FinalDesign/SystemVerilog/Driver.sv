class driver;
    virtual tb_inf vif;
    event drv_done;
    mailbox drv_mbx;
    
    task run();
        $display ("T=%0t [Driver] starting ...", $time);
        @(posedge vif.clk);
        forever begin
            Top_item item;
            $display ("T =%0t [Driver] waiting for item ...", $time);
            drv_mbx.get(item);
            item.print("Driver");
            vif.CalcActive = item.CalcActive;
            vif.CalcMode = item.CalcMode;
            vif.Busy = item.Busy;
            vif.DataOut = item.Dout;
            vif.InputKey = item.InputKey;
            vif.ValidCmd = item.ValidCmd;
            @(posedge vif.Clk);
            while(!vif.Busy) begin
                $display ("T = %0t [Driver] wait for operation to start", $time);
                @(posedge vif.Clk);
            end
            while(vif.Busy) begin
                $display("T = %0t [Driver] wait for operation to end", $time);
                @(posedge vif.Clk);
            end
            ->drv_done;
         end
   endtask           
endclass