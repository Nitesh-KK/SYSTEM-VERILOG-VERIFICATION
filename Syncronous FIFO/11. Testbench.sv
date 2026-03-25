`include"Interface.sv"
`include "Test.sv"

module tb;
  inter interf();
  test tst(interf);
  
  syn_fifo dut (.clk(interf.clk),
                .rst(interf.rst),
                .we(interf.we),
                .re(interf.re),
                .din(interf.din),
                .dout(interf.dout),
                .full(interf.full),
                .empty(interf.empty));
  
  initial begin
    interf.clk=0;
    forever #5 interf.clk=~interf.clk;
   
  end
  initial begin
    interf.rst=1;
    #15 interf.rst=0;
    interf.we=1;
    interf.re=0;
    #50 interf.re=1;
    interf.we=0;
    #50 interf.re=0;          
    interf.we=1;
    #50 interf.re=1;          
    interf.we=0;
    #500 $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
endmodule
