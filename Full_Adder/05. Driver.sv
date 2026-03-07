class driver;
  virtual inter interf;
  mailbox gen_to_drive;
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
      interf.a=trans.a;
      interf.b=trans.b;
      interf.c=trans.c;
      trans.display("Driver");
      #2;
    end
  endtask
endclass
