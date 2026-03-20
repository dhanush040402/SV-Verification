class scoreboard #(parameter depth , data_width);
  transaction #( depth , data_width) w_tr , r_tr;
  mailbox w_montosco;
  mailbox r_montosco;

  
  function new (mailbox w_montosco , mailbox r_montosco);
    this.w_montosco = w_montosco;
    this.r_montosco = r_montosco;
  endfunction
  
   task main();
    
    fork 
      
      wmain();
      rmain();
       
    join
  
  endtask
  
  
  task wmain();
    for (int i = 0 ; i < ( depth * 2 ) ; i++ ) begin
      w_montosco.get(w_tr);
      w_tr.wdisplay();
    end
  endtask
  
  task rmain();
    for (int i = 0 ; i < ( depth * 2 ) ; i++ ) begin
      r_montosco.get(r_tr);
      r_tr.rdisplay();
    end
  endtask
  
endclass
