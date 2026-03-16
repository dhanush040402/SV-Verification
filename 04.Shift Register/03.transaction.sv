class transaction;
  randc bit sin;
  bit sout;
  
  function void display();
    $display("sin = %0b | sout = %0b Time = %0t ",sin,sout,$time);
  endfunction
  
endclass
