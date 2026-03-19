`include "Interface.sv"
`include "Test.sv"
module tb;
  inter interf();
  test tst(interf);
  
  counter ca (.clk(interf.clk),.rst(interf.rst),.up(interf.up),.count(interf.count));
  
  initial begin
    interf.clk=0;
   forever #5 interf.clk=~interf.clk;
     end
  initial begin
     interf.rst=1;
    #15;interf.rst=0; 
  end
   
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
      #1000;
    $finish;
  end
endmodule
