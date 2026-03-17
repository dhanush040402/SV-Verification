`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment #(length,location);
  generator #(length,location) gen;
  driver #(length,location) driv;
  monitor #(length,location) moni;
  scoreboard #(length,location) sco;
  
  mailbox gen_to_driv;
  mailbox moni_to_sco;
  
  virtual intr.tb_driv inf1;
  virtual intr.tb_moni inf2;
  
  function new(virtual intr.tb_driv inf1 , virtual intr.tb_moni inf2);
    this.inf1 = inf1;
    this.inf2 = inf2;
    
    gen_to_driv=new();
    moni_to_sco=new();
    
    gen = new(gen_to_driv);
    driv = new(gen_to_driv,inf1);
    moni = new(moni_to_sco,inf2);
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
