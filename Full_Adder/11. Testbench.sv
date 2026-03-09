`include "Test.sv"
`include "Interface.sv"
module tb;
  inter interf();
  test tst(interf);
  full_adder fa(.a(interf.a),
                .b(interf.b),
                .c(interf.c),
                .sum(interf.sum),
                .carry(interf.carry));
endmodule
