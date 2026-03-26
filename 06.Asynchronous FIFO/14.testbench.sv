//testbench
`include "test.sv"

module tb;
  
  parameter depth = 8 ;
  parameter data_width = 8 ;
  
  variable #(depth,data_width) intr();
  test #(depth,data_width) t(intr);
  async_fifo_top #(depth,data_width) f(intr);
  
  initial begin
    
    intr.wclk = 1 ;
    forever #10 intr.wclk = ~ intr.wclk;
    
  end
  
  initial begin
    
    intr.rclk = 1 ;
    forever #15 intr.rclk = ~ intr.rclk;
    
  end
  
  initial begin
    $dumpfile("async_fifo.vcd");
    $dumpvars();  
    #1000;
    $finish;
  end
  
endmodule
