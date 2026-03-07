class monitor;
  transaction trans;
  virtual inter interf;
  mailbox mon_to_score;
  
  function new(virtual inter interf, mailbox mon_to_score);
    this.interf=interf;
    this.mon_to_score=mon_to_score;
  endfunction
  
  task run();
    trans=new();
    repeat(5) begin
      #2;
      trans.a=interf.a;
      trans.b=interf.b;
      trans.c=interf.c;
      trans.sum=interf.sum;
      trans.carry=interf.carry;
      mon_to_score.put(trans);
      trans.display("Monitor");
      #1;
    end
  endtask
endclass
