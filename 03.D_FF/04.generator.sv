class generator;
  
  mailbox gen_to_driv;
  
  function new(mailbox gen_to_driv);
    this.gen_to_driv = gen_to_driv;
  endfunction
  
  task gen;
    transaction tr;
   // tr=new();
    repeat(10)begin
      tr = new();
      assert(tr.randomize);
      gen_to_driv.put(tr);
      tr.display("Generator");
      #3;
    end
  endtask
  
endclass
