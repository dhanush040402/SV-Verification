`include "test.sv"

module tb;
  intr inf();
  siso s(inf.dut);
  test t(inf.tb);
  
  initial begin
    inf.clk = 0;
    forever #10 inf.clk = ~ inf.clk;
  end
  
  initial begin
    $dumpfile("siso.vcd");
    $dumpvars();
    inf.rst = 0;
    #20;
    inf.rst = 1;
    #500;
    $finish;
  end
  
endmodule
