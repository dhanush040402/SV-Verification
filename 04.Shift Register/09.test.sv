`include "environment.sv"

program test(intr.tb inf);
  environment envir;
  initial begin
    envir = new(inf);
    envir.envi();
  end
endprogram
