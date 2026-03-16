class driver;
  transaction tr;
  virtual intr.tb inf;
  mailbox gen_to_driv;
  
  function new(mailbox gen_to_driv , virtual intr.tb inf);
    this.gen_to_driv =  gen_to_driv;
    this.inf = inf;
  endfunction
  
  task driv();
    repeat(10)begin
      @(negedge inf.clk);
      gen_to_driv.get(tr);
      inf.sin = tr.sin;
    end
  endtask
endclass

      
