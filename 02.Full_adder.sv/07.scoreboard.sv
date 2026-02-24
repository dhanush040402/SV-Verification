class scoreboard;
  transaction tr;
  mailbox moni_to_sco;
  
  function new(mailbox moni_to_sco);
    this.moni_to_sco=moni_to_sco;
  endfunction
  
  task sco();
    repeat(8) begin
      moni_to_sco.get(tr);
      tr.display("Scoreboard");
      if ({tr.carry, tr.sum} == tr.a + tr.b + tr.c)
        $display("Pass");
      else
        $display("Fail");
      #3;
    end
  endtask
endclass
