class driver;
  transaction trans;
  virtual inter interf;
  mailbox gen_to_driv;
  
  function new(virtual inter interf,mailbox gen_to_driv);
    this.interf=interf;
    this.gen_to_driv=gen_to_driv;
  endfunction
  
  task run();
    trans=new();
    repeat(30) begin
      gen_to_driv.get(trans);
      @(negedge interf.clk) begin
        interf.d<=trans.d;
        trans.display("Driver");
      end
    end
  endtask
endclass
