`include "Transaction.sv"
`include "Generator.sv"
`include "Driver.sv"
`include "Monitor.sv"

class agent;
  virtual inter interf;
  transaction trans;
  generator gen;
  driver driv;
  monitor mon;
  
  mailbox gen_to_driv;
  mailbox mon_to_score;
  event e;
  
  function new(mailbox mon_to_score,virtual inter interf);
    this.mon_to_score=mon_to_score;
    this.interf=interf;
    gen_to_driv=new();
    gen=new(gen_to_driv);
    driv=new(interf,gen_to_driv);
    mon=new(interf,mon_to_score);
    gen.e1=this.e;
  endfunction
  task run();
    fork
      gen.run();
      driv.run();
      mon.run();
    join
  endtask
endclass
