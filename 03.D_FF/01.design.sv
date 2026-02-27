`include "interface.sv"
module d_ff(intr inf);
  always_ff @(posedge inf.clk or negedge inf.rst)begin
    if(inf.rst)
      inf.q<=0;
    else
      inf.q<=inf.d;
  end
endmodule
