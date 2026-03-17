`include "interface.sv"

module sync_fifo #(parameter length = 8 , location = 4 )(intr inf);
  reg [length-1:0]mem[location-1:0];
  reg [$clog2(location):0]w_ptr,r_ptr;
  
  always @(posedge inf.clk)begin
    if(inf.rst)begin
      inf.dataout<=0;
      w_ptr<=0;
      r_ptr<=0;
    end
    else if(inf.w_en && !inf.full)begin
      mem[w_ptr[$clog2(location)-1:0]]<=inf.datain;
      w_ptr <= w_ptr + 1;
    end
    else if(inf.r_en && !inf.empty)begin
      inf.dataout <= mem[r_ptr[$clog2(location)-1:0]];
      r_ptr <= r_ptr + 1;
    end
    
  end
  
  assign inf.full = (w_ptr[$clog2(location)] != r_ptr[$clog2(location)]) && (w_ptr[$clog2(location)-1:0] == r_ptr[$clog2(location)-1:0]);
  
  assign inf.empty = (w_ptr == r_ptr);
  
endmodule
  
  
