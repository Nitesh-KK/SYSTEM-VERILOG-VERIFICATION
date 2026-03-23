class scoreboard ;
  mailbox mon_to_score;
  transaction trans;
  bit [31:0] que[$];
  bit [31:0] exp_q[$];
  event e1;
  
  function new(mailbox mon_to_score);
    this.mon_to_score=mon_to_score;
  endfunction
  task run();
    forever begin
      mon_to_score.get(trans);
      if (trans.rst) begin
        que.delete();
      	exp_q.delete();
      end
      if (trans.we && !trans.full)
      	que.push_back(trans.din);
      if (trans.re && !trans.empty) begin
      	if (que.size() != 0)
        	exp_q.push_back(que.pop_front());
      end
      if (exp_q.size() != 0) begin
        bit [31:0] exp;
      	exp = exp_q.pop_front();
        if (trans.dout == exp)
          $display("-----FIFO PASS-----");
        else
          $display("-----FIFO FAIL-----");
      end
    end
  endtask
endclass
