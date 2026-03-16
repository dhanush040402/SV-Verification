class monitor;
  transaction tr;
  virtual intr.tb inf;
  mailbox moni_to_sco;
  
  function new(mailbox moni_to_sco , virtual intr.tb inf);
    this.moni_to_sco =  moni_to_sco;
    this.inf = inf;
  endfunction
  
  task moni();
    repeat(10)begin
      @(posedge inf.clk);  
      tr = new();
      tr.sin = inf.sin;
      tr.sout = inf.sout;
      moni_to_sco.put(tr);
    end
  endtask
endclass
