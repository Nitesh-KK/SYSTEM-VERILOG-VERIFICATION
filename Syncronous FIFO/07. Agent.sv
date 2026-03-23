`include "Transaction.sv"
`include "Driver.sv"
`include "Generator.sv"
`include "Monitor.sv"
class agent;
  transaction trans;
  virtual inter interf;
  driver drive;
  generator gen;
  monitor mon;
  event e;
  
  mailbox gen_to_drive;
  mailbox mon_to_score;
  
  function new(mailbox mon_to_score,virtual inter interf);
    this.mon_to_score=mon_to_score;
    this.interf=interf;
    gen_to_drive=new();
    gen=new(gen_to_drive);
    drive=new(gen_to_drive,interf);
    mon=new(interf,mon_to_score);
    gen.e1=this.e;
  endfunction
  task run();
    fork
      gen.run();
      drive.run();
      mon.run();
    join
  endtask
endclass
