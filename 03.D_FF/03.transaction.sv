class transaction;
  rand bit d;
  rand bit rst;
  bit q;
  
  function display(string name);
    $display("--------%s--------",name);
    $display("| reset = %0d | d = %0d | q = %0d | Time = %0t ",rst,d,q,$time);
  endfunction
  
endclass
