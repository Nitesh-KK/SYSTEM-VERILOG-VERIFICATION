`include "Agent.sv"
`include "Scoreboard.sv"
class environment;
  agent age;
  scoreboard score;
  virtual inter interf;
  
  mailbox mon_to_score;
  
  function new(virtual inter interf);
    this.interf=interf;
    mon_to_score=new();
    age=new(mon_to_score,interf);
    score=new(mon_to_score);
    score.e1=age.gen.e1;
  endfunction
  task test();
    fork
      age.run();
      score.run();
    join
  endtask
endclass
