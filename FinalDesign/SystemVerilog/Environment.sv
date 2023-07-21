`include "Monitor.sv"
`include "Scoreboard.sv"

class env;
    monitor m0;
    scoreboard s0;
    mailbox ik_scb_mbx, do_scb_mbx, int_scb_mbx;
    
    function new();
        m0 = new;
        s0 = new;
        ik_scb_mbx = new();
        do_scb_mbx = new();
        int_scb_mbx = new();
    endfunction
    
    virtual task run();
        m0.ik_scb_mbx = ik_scb_mbx;
        m0.do_scb_mbx = do_scb_mbx;
        m0.int_scb_mbx = int_scb_mbx;
        s0.ik_scb_mbx = ik_scb_mbx;  
        s0.do_scb_mbx = do_scb_mbx; 
        s0.int_scb_mbx = int_scb_mbx;     
        fork
            s0.run();
            m0.run();
        join_none
    endtask
endclass