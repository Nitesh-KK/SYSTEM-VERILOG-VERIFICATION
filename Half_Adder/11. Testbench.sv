`include "Test.sv"
`include "Interface.sv"
module tb;
  inter interf();
  test tst(interf);
  half_adder ha(.a(interf.a),
                .b(interf.b),
                .sum(interf.sum),
                .carry(interf.carry));
endmodule
