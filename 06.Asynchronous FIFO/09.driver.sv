class driver #(parameter depth , data_width);
  transaction #( depth , data_width) tr;
  mailbox gentodri;
  virtual variable.wd wd1;
  virtual variable.rd rd1;
  
  function new (mailbox gentodri , virtual variable.wd wd1 , virtual variable.rd rd1);
    this.gentodri = gentodri;
    this.wd1 = wd1;
    this.rd1 = rd1;
  endfunction
  
  task main();
    forever begin
      gentodri.get(tr);
    
    fork 
      
      wmain();
      rmain();
           
    join
      
    end
  
  endtask
  
  
  task wmain();
    for (int i = 0 ; i < ( depth * 2 ) ; i++ ) begin
      @(negedge wd1.wclk)
      wd1.w_drive.wrst <= tr.wrst;
      wd1.w_drive.w_en <= tr.w_en;
      wd1.w_drive.data_in <= tr.data_in;
    end
  endtask
  
  
  task rmain();
    for (int i = 0 ; i < ( depth * 2 ) ; i++ ) begin
      @(negedge rd1.rclk)
      rd1.r_drive.rrst <= tr.rrst;
      rd1.r_drive.r_en <= tr.r_en;
        
    end
  endtask
  
endclass
  
        
    
