`include "interface.sv"
module siso (
  intr.dut inf
);
  
  reg[3:0]shift_reg;
  always @(posedge inf.clk or negedge inf.rst)begin
    if(!inf.rst)
      shift_reg<=4'b0000;
    else
      shift_reg<={shift_reg[2:0],inf.sin};
  end
  
  assign inf.sout = shift_reg[3];

endmodule
