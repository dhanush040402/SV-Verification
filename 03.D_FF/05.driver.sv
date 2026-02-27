class driver;
  transaction tr;
  virtual intr inf;
  mailbox gen_to_driv;
  
  function new(virtual intr inf , mailbox gen_to_driv);
    this.inf=inf;
    this.gen_to_driv=gen_to_driv;
  endfunction
  
  task driv();
   
    tr=new();
    repeat(10) begin
      @(posedge inf.clk);
       $display("display");
      gen_to_driv.get(tr);
      inf.rst=tr.rst;
      inf.d=tr.d;
     
      tr.display("driver");
      #3;
    end
    
  endtask
  
endclass
    
