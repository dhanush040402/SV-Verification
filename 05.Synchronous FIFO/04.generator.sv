class generator #(length,location);
  transaction #(length,location) tr;
  mailbox gen_to_driv;
  
  function new(mailbox gen_to_driv);
    this.gen_to_driv=gen_to_driv;
  endfunction
  
  task gen();
    
    for(int i = 0 ; i <= (location *2) ; i++)begin
      tr = new();
      if(i==0)begin
        
        tr.c1.constraint_mode(1);
        tr.randomize();
        tr.w_en = 1;
        tr.r_en = 0;
        
      end
      
      else if (i < location + 1 )begin
        tr.c1.constraint_mode(0);
        tr.randomize() with { rst == 0 ;};
        tr.w_en = 1;
        tr.r_en = 0;
      end
      
      else if (i < (location * 2)+1)begin
        tr.c1.constraint_mode(0);
        tr.randomize() with { rst == 0 ; datain == 0 ;};
        tr.w_en = 0;
        tr.r_en = 1;
      end
      
      gen_to_driv.put(tr);
      end
  endtask
        

  
endclass

