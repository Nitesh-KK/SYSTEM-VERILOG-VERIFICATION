interface inter#(parameter N=5,M=32);
  logic clk;
  logic rst;
  logic en;
  logic [N-1:0] din;
  logic [$clog2(M)-1:0] addr;
  logic [N-1:0] dout;
endinterface
