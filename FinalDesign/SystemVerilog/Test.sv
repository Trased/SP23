////
////
//// NU ESTE FOLOSIT !!!!!
////
////

// class test;
//     env e0;
//     mailbox drv_mbx;
    
//     function new();
//         drv_mbx = new();
//         e0 = new();
//     endfunction
    
//     virtual task run();
//         e0.d0.drv_mbx = drv_mbx;
//         fork
//             e0.run();
//         join_none
        
//         apply_stim();
//     endtask
    
//     virtual task apply_stim();
//         Top_item item;
//         $display("T=%0t [Test] Starting stimulus ...", $time);
//         item = new;
//          // TO FINISH TEST AND TESTBENCH
//          // ALSO TO REVIEW THE SCOREBOARD LOGIC!!!!
//     endtask

// endclass
