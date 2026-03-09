`include "Agent.sv"
`include "Scoreboard.sv"

class environment;
  virtual inter interf;
  agent age;
  scoreboard score;
  
  mailbox gen_to_drive;
  mailbox mon_to_score;
  
  function new(virtual inter interf);
    this.interf=interf;
    gen_to_drive=new();
    mon_to_score=new();
    age=new(interf,mon_to_score);
    score=new(mon_to_score);
  endfunction
  task test();
    fork
      age.run();
      score.run();
    join
  endtask
endclass
