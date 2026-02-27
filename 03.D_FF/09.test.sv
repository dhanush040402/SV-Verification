`include "environment.sv"

program test(intr inf);
  environment envi;
  initial begin
    envi=new(inf);
    envi.envi();
    #2000;
  end
endprogram
