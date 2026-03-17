`include "Interface.sv"
`include "Test.sv"
module dff_tb;
  initial begin
    interf.clk=0;
  end
  always #5 interf.clk=~interf.clk;
  inter interf();
  test tst(interf);
  dff dut(.clk(interf.clk),.rst(interf.rst),.d(interf.d),.q(interf.q));
  initial begin
    interf.rst=1;
    #15 interf.rst=0;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,dff_tb);
    #500 $finish;
  end
endmodule
