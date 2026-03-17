`include "test.sv"

module tb;
  parameter length = 8 ;
  parameter location=16 ;
  
  intr #(length,location) inf();
  test #(length,location) t(inf);
  sync_fifo #(length,location) f(inf.dut);
  
  initial begin
    inf.clk = 1;
    forever #10 inf.clk = ~ inf.clk;
  end
  
  initial begin
    $dumpfile("sync_fifo.vcd");
    $dumpvars();
      
  end
  
endmodule
    
