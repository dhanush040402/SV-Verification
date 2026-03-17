class driver #(length,location);
  transaction #(length,location) tr;
  mailbox gen_to_driv;
  virtual intr.tb_driv inf;
  
  function new(mailbox gen_to_driv , virtual intr.tb_driv inf);
    this.gen_to_driv = gen_to_driv;
    this.inf = inf;
  endfunction
  
  task driv();
    
    for(int i = 0 ; i <= (location * 2) ; i++ )begin
      @(negedge inf.clk);
      gen_to_driv.get(tr);
      inf.driv.datain<=tr.datain;
      inf.driv.rst<=tr.rst;	
      inf.driv.w_en<=tr.w_en;
      inf.driv.r_en<=tr.r_en;
      
    end
  endtask
  
endclass

