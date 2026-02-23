`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  transaction tr;
  
  generator gen;
  driver driv;
  monitor moni;
  scoreboard sco;
  
  mailbox gen_to_driv;
  mailbox moni_to_sco;
  
  virtual intr inf;
  
  
  function new (virtual intr inf);
    this.inf=inf;
    tr=new();
    gen_to_driv=new();
    moni_to_sco=new();
    
    gen=new(gen_to_driv);
    driv=new(inf,gen_to_driv);
    moni=new(inf,moni_to_sco);
    sco=new(moni_to_sco);
  endfunction
  
  task envi();
    fork
      gen.gen();
      driv.driv();
      moni.mon();
      sco.sco();
    join
  endtask
endclass
  
