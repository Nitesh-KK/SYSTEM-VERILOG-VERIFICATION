class generator;
  mailbox gen_to_drive;
  transaction trans;
  event e1;
  
  function new(mailbox gen_to_drive);
    this.gen_to_drive=gen_to_drive;
  endfunction
  
  task run();
    repeat(25) begin
      trans=new();
      void'(trans.randomize());
      trans.display("Generator");
      gen_to_drive.put(trans);
      @e1;
    end
  endtask
endclass
