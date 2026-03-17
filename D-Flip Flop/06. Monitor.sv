class monitor;
  virtual inter interf;
  transaction trans;
  mailbox mon_to_score;
  
  function new(virtual inter interf,mailbox mon_to_score);
    this.interf=interf;
    this.mon_to_score=mon_to_score;
  endfunction
  
  task run();
    repeat(50) begin
      trans=new();
      @(posedge interf.clk) begin
      	trans.rst=interf.rst;
      	trans.d=interf.d;
      	trans.q=interf.q;
      	mon_to_score.put(trans);
      	trans.display("Monitor");
      end
    end
  endtask
endclass
