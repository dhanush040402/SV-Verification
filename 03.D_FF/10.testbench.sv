`include "test.sv"

module tb;
  intr inf();
  test tst(inf);
  d_ff dut(inf);
  initial inf.clk = 0;
  
  always #5 inf.clk = ~inf.clk;
  
  initial begin
    $dumpfile("d_ff.vcd");
    $dumpvars(0);
    
   
    #500;
    $finish;
  end
endmodule
    
    
