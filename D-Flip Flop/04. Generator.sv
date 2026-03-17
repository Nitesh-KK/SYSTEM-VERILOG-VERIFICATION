class generator;
  mailbox gen_to_driv;
  transaction trans;
  event e1;
  
  function new(mailbox gen_to_driv);
    this.gen_to_driv=gen_to_driv;
  endfunction
  
  task run();
    this.trans=trans;
    repeat(30) begin
      trans=new();
      void'(trans.randomize());
      trans.display("Generator");
      gen_to_driv.put(trans);
      @e1;
    end
  endtask
endclass
