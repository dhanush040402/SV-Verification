class scoreboard #(length,location);
  transaction #(length,location) tr;
  mailbox moni_to_sco;
  
  function new(mailbox moni_to_sco);
    this.moni_to_sco = moni_to_sco;
  endfunction
  
  task sco();
    
    for(int i = 0 ; i <= (location * 2) ; i++ )begin
      moni_to_sco.get(tr);
      tr.display();
      
      end
  endtask
  
endclass
      
      
