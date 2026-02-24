class transaction;
  randc bit a;
  randc bit b;
  randc bit c;
  bit sum;
  bit carry;
  
  function void display(string name);
    $display("-------%s-------",name);
    $display(" a = %0b | b = %0b | c = %0b | sum = %0b | carry = %b |",a,b,c,sum,carry);
  endfunction
endclass
