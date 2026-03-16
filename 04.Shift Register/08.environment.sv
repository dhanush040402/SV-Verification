`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  
  generator gen;
  driver driv;
  monitor moni;
  scoreboard sco;
  
  mailbox gen_to_driv;
  mailbox moni_to_sco;
  
  virtual intr.tb inf;
  
  function new (virtual intr.tb inf);
    this.inf = inf;
    
    gen_to_driv = new();
    moni_to_sco = new();
    
    gen = new(gen_to_driv);
    driv = new(gen_to_driv,inf);
    moni = new(moni_to_sco,inf);
    sco = new(moni_to_sco);
    
  endfunction
  
  task envi();
    fork
      gen.gen();
      driv.driv();
      moni.moni();
      sco.sco();
    join
  endtask
  
endclass
    
