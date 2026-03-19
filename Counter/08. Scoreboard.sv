class scoreboard;
  mailbox mon_to_score;
  transaction trans;
  bit [5:0] pastcount;
  event e1;
  
  function new(mailbox mon_to_score);
    this.mon_to_score=mon_to_score;
  endfunction
  task run();
    repeat(25) begin
      mon_to_score.get(trans);
      trans.display("Scpreboard");
      if((trans.rst==1) && (trans.count==0))
        $display("-----Counter reseted-----");
      else if(trans.up==1) begin
        if(trans.count==pastcount+1)
          $display("-----Upcount passed-----");
        else 
          $display("-----Upcount failed-----");
      end
      else if(trans.up==0) begin
        if(trans.count==pastcount-1)
          $display("-----Downcount passed-----");
        else 
          $display("-----Downcount failed-----");
      end
      pastcount=trans.count;
      ->e1;
    end
  endtask
endclass
