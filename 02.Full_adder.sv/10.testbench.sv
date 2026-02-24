`include "test.sv"

module tb;
  intr inf();
  test tst(inf);
  full_adder fa(inf);
  initial begin
    $dumpfile("fa.vcd");
    $dumpvars(0);
    #100;
  end
endmodule
