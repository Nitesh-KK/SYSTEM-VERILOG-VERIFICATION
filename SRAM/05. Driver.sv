class driver;
  mailbox gen_to_drive;
  transaction trans;
  virtual inter interf;
  
  function new(mailbox gen_to_drive,virtual inter interf);
    this.gen_to_drive=gen_to_drive;
    this.interf=interf;
  endfunction
  
  task run();
    trans=new();
    repeat(25) begin
      gen_to_drive.get(trans);
      @(posedge interf.clk) begin
      	interf.rst=trans.rst;
      	interf.en=trans.en;
        interf.din=trans.din;
        interf.addr=trans.addr;
      	trans.display("Driver");
      end
    end
  endtask
endclass
