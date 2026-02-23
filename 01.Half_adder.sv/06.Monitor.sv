class monitor;
  transaction tr;
  mailbox moni_to_sco;
  virtual intr inf;
  
  function new(virtual intr inf, mailbox moni_to_sco);
    this.inf=inf;
    this.moni_to_sco=moni_to_sco;
  endfunction
  
  task mon();
    tr=new();
    repeat(5) begin;
      tr.a=inf.a;
      tr.b=inf.b;
      tr.sum=inf.sum;
      tr.carry=inf.carry;
      moni_to_sco.put(tr);
      tr.display("Monitor");
      #2;
    end
  endtask
endclass
