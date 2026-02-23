class generator;
  transaction tr;
  mailbox gen_to_driv;
  
  function new(mailbox gen_to_driv);
    this.gen_to_driv=gen_to_driv;
  endfunction
  
  task gen();
    tr=new();
    repeat(5) begin
      tr.randomize();
      gen_to_driv.put(tr);
      tr.display("Generator");
      #3;
    end
  endtask
endclass
