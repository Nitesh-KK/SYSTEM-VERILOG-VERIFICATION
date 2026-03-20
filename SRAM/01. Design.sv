module sram #(parameter N=5,M=32)(
  input clk,rst,en,
  input [N-1:0] din,
  input [$clog2(M)-1:0] addr,
  output reg [N-1:0] dout
);
  reg [N-1:0] ram[0:M-1];
  always @(posedge clk) begin
    if(rst) begin
      dout<=0;
      foreach(ram[i]) ram[i]=0;
    end
    else begin
      if(en)
        ram[addr]<=din;
      else
        dout<=ram[addr];
    end
  end
endmodule
