`include "Interface.sv"
`include "Test.sv"

module tb;
  inter interf();
  test tst(interf);
  
  sram r(.clk(interf.clk),.rst(interf.rst),.din(interf.din),.addr(interf.addr),.en(interf.en),.dout(interf.dout));
  
  initial begin
    interf.clk=0;
   forever #5 interf.clk=~interf.clk;
  end
  initial begin
    interf.rst=1;
    #40 interf.rst=0;  
    #700;
    $finish;
  end 
  initial begin
    $dumpfile("dumpfile.vcd");
    $dumpvars(0,tb);
  end
endmodule
