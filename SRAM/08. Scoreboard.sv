class scoreboard #(parameter N=5,M=32);
  mailbox mon_to_score;
  transaction trans;
  bit [N-1:0] ram[0:M-1];
  event e1;
  
  function new(mailbox mon_to_score);
    this.mon_to_score=mon_to_score;
  endfunction
  task run();
    repeat(25) begin
      mon_to_score.get(trans);
      trans.display("Scoreboard");
      if((trans.rst==1)&&(trans.dout==0)) begin
        foreach(ram[i]) ram[i]=0;
        $display("-----RAM Reset-----");
      end
      else begin
        if(trans.en==1) begin
          ram[trans.addr] = trans.din; 
          if (ram[trans.addr]==trans.din)
            $display("-----Write pass-----");
          else 
            $display("-----Write fail-----");
        end
        else begin
          trans.dout=ram[trans.addr];
          if(trans.dout==ram[trans.addr])
            $display("-----Read pass-----");
          else
            $display("-----Read fail-----");
        end
      end
      -> e1;
    end
  endtask
endclass
