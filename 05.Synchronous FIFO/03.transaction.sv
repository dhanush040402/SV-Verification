class transaction #(length,location);
  rand bit[length-1:0] datain;
  rand bit w_en;
  rand bit r_en;
  bit full;
  bit empty;
  rand bit rst;
  bit [length-1:0] dataout ;
  
  constraint c1 {rst == 1 ; datain == 0 ;}
  
  function void display();
    $display("W_en = %d | data in = %d | full = %d | R_en = %d | data out = %d | empty = %d | Time = %0t |",w_en,datain,full,r_en,dataout,empty,$time);
  endfunction
  
endclass
