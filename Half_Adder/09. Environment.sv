`include "Agent.sv"
`include "Scoreboard.sv"

class environment;
  virtual inter interf;
  agent age;
  scoreboard score;
 
  mailbox mon_to_score;
  
  function new(virtual inter interf);
    this.interf=interf;
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
    
