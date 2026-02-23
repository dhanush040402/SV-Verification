`include "interface.sv"

module half_adder(intr inf);
  assign {inf.carry, inf.sum} = inf.a + inf.b ;
endmodule
