class scoreboard;
  mailbox mon_to_score;
  transaction trans;
  
  function new(mailbox mon_to_score);
    this.mon_to_score=mon_to_score;
  endfunction
  task run();
    repeat(5) begin
      mon_to_score.get(trans);
      trans.display("Scoreboard");
      if(((trans.a^trans.b)==trans.sum)&& ((trans.a & trans.b)==trans.carry))
        $display("-----PASS-----");
      else $display("-----FAIL-----");
    end
  endtask
endclass
