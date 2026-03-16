class scoreboard;
  transaction tr;
  mailbox moni_to_sco;
  
  function new(mailbox moni_to_sco);
    this.moni_to_sco = moni_to_sco;
  endfunction
  
  task sco();
    repeat(10)begin
      moni_to_sco.get(tr);
      tr.display();
    end
  endtask
  
endclass

