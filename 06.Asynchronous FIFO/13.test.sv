`include "environment.sv"

program test #( depth , data_width) (variable intr);
  environment #( depth , data_width) envi;
  
  initial begin
    
    envi = new( intr.wd , intr.rd , intr.wm , intr.rm);
    envi.envi();
    
  end
  
endprogram
