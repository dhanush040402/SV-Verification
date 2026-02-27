class scoreboard;
  transaction tr;
  mailbox moni_to_sco;
  
  function new(mailbox moni_to_sco);
    this.moni_to_sco=moni_to_sco;
  endfunction
  
  task sco();
    tr=new();
    repeat(10) begin
      moni_to_sco.get(tr);
      tr.display("Scoreboard");
      #3;
      
    end
    
  endtask
  
endclass
