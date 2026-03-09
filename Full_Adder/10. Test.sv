`include "Environment.sv"
program test(inter interf);
  environment env;
  initial begin
    env=new(interf);
    env.test();
  end
endprogram
