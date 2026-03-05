class driver;
  mailbox gen_to_drive;
  virtual inter interf;
  transaction trans;
  
  function new(mailbox gen_to_drive,virtual inter interf);
    this.gen_to_drive=gen_to_drive;
    this.interf=interf;
  endfunction
  
  task run();
    trans=new();
    repeat(5) begin
      #1;
      gen_to_drive.get(trans);
      trans.display("Driver");
      interf.a=trans.a;
      interf.b=trans.b;
      #2;
    end
  endtask
endclass
