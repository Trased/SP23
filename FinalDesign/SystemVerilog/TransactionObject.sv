class Top_item;
    rand bit [3:0] Dout, Din;
    rand bit [7:0] Addr, InA, InB;
    rand bit [3:0] Sel;
    rand bit InputKey, ValidCmd, RWMem, ConfigDiv, Reset, CalcActive, CalcMode,Busy, DOutValid;
    function void print(string tag ="");
        $display("T=%0t [%s] InputKey = %0d, ValidCmd = %0d, RWMem = %0d, ConfigDiv = %0d, Reset = %0d, Addr = 0x%0h, InA = 0x%0h, InB = 0x%0h, Sel = 0x0%0h, Din = 0x%0h, CalcActive = %0d, CalcMode = %0d, Busy = %0d, DOutValid = %0d, DataOut = 0x%0h ", 
                    $time, tag, InputKey, ValidCmd, RWMem, ConfigDiv, Reset, Addr, InA, InB, Sel, Din, CalcActive, CalcMode, Busy, DOutValid, Dout);
    endfunction
endclass