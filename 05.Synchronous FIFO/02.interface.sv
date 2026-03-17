interface intr #(length = 8 ,location = 4);
  logic rst;
  logic clk;
  logic [length-1:0]datain;
  logic [length-1:0]dataout;
  logic w_en;
  logic r_en;
  logic full;
  logic empty;
  
  clocking driv @(negedge clk);
    default input #0 output #1;
    
    input dataout;
    input full;
    input empty;
    
    output datain;
    output rst;
    output w_en;
    output r_en;
    
  endclocking
  
  clocking moni @(posedge clk);
    default input #0;
    
    input dataout;
    input full;
    input empty;
    input  datain;
    input rst;
    input  w_en;
    input  r_en;
    
  endclocking
  
  modport tb_driv( clocking driv , input clk);
    
  modport tb_moni( clocking moni , input clk);
      
  modport dut( input datain,rst,w_en,r_en,clk, output full,empty,dataout);
    
endinterface
