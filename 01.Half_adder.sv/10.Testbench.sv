`include "test.sv"
//`include "interface.sv"
module tb;
  intr inf();
  test tst(inf);
  half_adder ha(inf);
  initial begin
    $dumpfile("ha.vcd");
    $dumpvars();
    #100;
  end
endmodule
