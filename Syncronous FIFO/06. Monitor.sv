class monitor;
  mailbox mon_to_score;
  transaction trans;
  virtual inter interf;
  
  function new(virtual inter interf,mailbox mon_to_score);
    this.interf=interf;
    this.mon_to_score=mon_to_score;
  endfunction
  
  task run();
    repeat(25) begin
      trans=new();
      @(posedge interf.clk) begin
        trans.rst=interf.rst;
        trans.re=interf.re;
        trans.we=interf.we;
        trans.din=interf.din;
        trans.dout=interf.dout;
        trans.full=interf.full;
        trans.empty=interf.empty;
        mon_to_score.put(trans);
        trans.display("Monitor");
      end
    end
  endtask
endclass
