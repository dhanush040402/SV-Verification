class generator;
  transaction tr;
  mailbox gen_to_driv;
  
  function new(mailbox gen_to_driv);
    this.gen_to_driv = gen_to_driv;
  endfunction
  
  task gen();
    repeat(10)begin
      tr = new();
      tr.randomize();
      gen_to_driv.put(tr);
    end
  endtask
  
endclass
