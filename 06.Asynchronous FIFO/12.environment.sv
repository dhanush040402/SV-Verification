`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment #(parameter depth , data_width);
  
  generator #( depth , data_width) gen ;
  driver #( depth , data_width) dri ;
  monitor #( depth , data_width) mon ;
  scoreboard #( depth , data_width) sco;
  
  mailbox gentodri;
  mailbox w_montosco;
  mailbox r_montosco;
  
  virtual variable.wd wd1;
  virtual variable.rd rd1;
  
  virtual variable.wm wm1;
  virtual variable.rm rm1;
  
  function new ( virtual variable.wd wd1 , virtual variable.rd rd1 , virtual variable.wm wm1 , virtual variable.rm rm1 );
    this.wd1 = wd1;
    this.rd1 = rd1;
    this.wm1 = wm1;
    this.rm1 = rm1;
    
    gentodri = new();
    w_montosco = new();
    r_montosco = new();
    
    gen = new(gentodri);
    dri = new(gentodri,wd1,rd1);
    mon = new(w_montosco,r_montosco,wm1,rm1);
    sco = new(w_montosco,r_montosco);
    
  endfunction
  
  task envi();
    fork 
      
      gen.main();
      dri.main();
      mon.main();
      sco.main();
      
    join
    
  endtask
  
endclass
    
    
