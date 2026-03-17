class monitor #(length,location);
  transaction #(length,location) tr;
  mailbox moni_to_sco;
  virtual intr.tb_moni inf;
  
  function new(mailbox moni_to_sco , virtual intr.tb_moni inf);
    this.moni_to_sco = moni_to_sco;
    this.inf = inf;
  endfunction
  
  task moni();
    
    for(int i = 0 ; i <= (location * 2) ; i++ )begin
      @(posedge inf.clk);
      tr=new();
      tr.datain = inf.moni.datain;
      tr.dataout = inf.moni.dataout;
      tr.w_en = inf.moni.w_en;
      tr.r_en = inf.moni.r_en;
      tr.empty = inf.moni.empty;
      tr.full = inf.moni.full;
      tr.rst = inf.moni.rst;
      
      moni_to_sco.put(tr);
      
    end
  endtask
  
endclass
      
      
