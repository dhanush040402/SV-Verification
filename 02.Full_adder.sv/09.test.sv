`include "environment.sv"

program test(intr inf);
  environment envi;
  initial begin
   envi=new(inf);
   envi.envi();
  end
endprogram
