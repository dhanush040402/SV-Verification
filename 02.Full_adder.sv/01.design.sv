`include "interface.sv"

module full_adder(intr v);
  assign{v.carry,v.sum}=v.a+v.b+v.c;
endmodule
