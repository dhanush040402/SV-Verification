`include "environment.sv"

program test #(length,location) (intr inf);
  environment #(length,location) envi;
  initial begin
    envi = new(inf.tb_driv , inf.tb_moni);
    envi.envi();
  end
endprogram

