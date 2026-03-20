class generator #(parameter depth , data_width);
  transaction #( depth , data_width) tr;
  mailbox gentodri;
  
  function new (mailbox gentodri);
    this.gentodri = gentodri;
  endfunction
  
  task main();
    for (int i = 0 ; i < ( depth * 2 ) ; i++ ) begin
      tr = new();
      
      if (i==0)begin
        tr.rst_c.constraint_mode(1);
        tr.w_c.constraint_mode(0);
        tr.r_c.constraint_mode(0);
        tr.randomize();
      end
      
      else if ( i  < (depth + 1 ) ) begin
        tr.rst_c.constraint_mode(0);
        tr.w_c.constraint_mode(1);
        tr.r_c.constraint_mode(0);
        tr.randomize();
      end
      
      else if ( i  < (depth * 2 ) ) begin
        tr.rst_c.constraint_mode(0);
        tr.w_c.constraint_mode(0);
        tr.r_c.constraint_mode(1);
        tr.randomize();
      end
      
      gentodri.put(tr);
    end
  endtask
  
endclass
        
      
      
        
