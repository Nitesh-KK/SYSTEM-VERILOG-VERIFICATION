interface inter #(parameter N=5,M=32,D=$clog2(M));
  logic clk;
  logic rst;
  logic we;
  logic re;
  logic [N-1:0] din;
  logic full;
  logic empty;
  logic [N-1:0] dout;
endinterface
