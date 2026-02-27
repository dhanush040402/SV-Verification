class monitor;
  transaction tr;
  virtual intr inf;
  mailbox moni_to_sco;
  
  function new(virtual intr inf , mailbox moni_to_sco);
    this.inf=inf;
    this.moni_to_sco=moni_to_sco;
  endfunction
  
  task moni();
    tr=new();
    repeat(10) begin
      @(negedge inf.clk);
      tr.rst=inf.rst;
      tr.d=inf.d;
      tr.q=inf.q;
      moni_to_sco.put(tr);
      tr.display("Monitor");
      #3;
    end
    
  endtask
  
endclass
