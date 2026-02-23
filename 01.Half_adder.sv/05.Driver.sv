class driver;
  transaction tr;
  mailbox gen_to_driv;
  virtual intr inf;
  
  function new(virtual intr inf,mailbox gen_to_driv);
    this.inf=inf;
    this.gen_to_driv=gen_to_driv;
  endfunction
  
  task driv();
    tr=new();
    repeat(5) begin
      gen_to_driv.get(tr);
      
      inf.a=tr.a;
      inf.b=tr.b;
      tr.display("Drive");
      #3;
    end
  endtask
endclass
