class transaction;
  
  randc bit a;
  randc bit b;
  
  bit sum;
  bit carry;
  
  function void display(string name);
    $display("-------%s-------",name);
    $display("a = %0b | b = %0b | sum = %0b | carry = %0b |",a,b,sum,carry);
  endfunction
  
endclass
