class scoreboard;
  transaction trans;
  mailbox mon_to_score;
  event e1;
  
  function new(mailbox mon_to_score);
    this.mon_to_score=mon_to_score;
  endfunction
  task run();
    repeat(30) begin
      mon_to_score.get(trans);
      trans.display("Scoreboard");
      if(((trans.rst==1)&&(trans.q==0))||((trans.rst==0)&&(trans.q==trans.d)))
        $display("-----PASS-----");
      else $display("-----FAIL-----");
      -> e1;
    end
  endtask
endclass
