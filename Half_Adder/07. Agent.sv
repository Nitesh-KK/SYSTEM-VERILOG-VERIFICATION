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
  
  mailbox gen_to_drive;
  mailbox mon_to_score;
  
  function new(virtual inter interf,mailbox mon_to_score);
    this.interf=interf;
    this.mon_to_score=mon_to_score;
    gen_to_drive=new();
    gen=new(gen_to_drive);
    driv=new(gen_to_drive,interf);
    mon=new(interf, mon_to_score);
  endfunction
  
  task run();
    fork 
      gen.run();
      driv.run();
      mon.run();
    join
  endtask
endclass
