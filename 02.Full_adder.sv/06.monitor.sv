class monitor;
  transaction tr;
  mailbox moni_to_sco;
  virtual intr inf;
  
  function new(virtual intr inf , mailbox moni_to_sco);
    this.inf=inf;
    this.moni_to_sco=moni_to_sco;
  endfunction
  
  task moni();
    tr=new();
    repeat(8) begin
      tr.a=inf.a;
      tr.b=inf.b;
      tr.c=inf.c;
      tr.sum=inf.sum;
      tr.carry=inf.carry;
      moni_to_sco.put(tr);
      tr.display("Monitor");
      #3;
      
    end
  endtask
endclass
