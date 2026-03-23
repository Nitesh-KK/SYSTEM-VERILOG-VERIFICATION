module syn_fifo #(parameter N=5,M=32,D=$clog2(M))(
  input clk,rst,we,re,
  input [N-1:0] din,
  output full,empty,
  output reg [N-1:0] dout
);
  reg [D-1:0] wptr;
  reg [D-1:0] rptr;
  reg [N-1:0] mem [0:M-1];
  
  always @(posedge clk) begin
    if(rst) begin
      dout<=0;
      wptr<=0;
      rptr<=0;
    end
    else begin
      if(we && !full) begin
        mem[wptr]<=din;
        wptr<=wptr+1;
      end
      if(re && !empty) begin
        dout<=mem[rptr];
        rptr<=rptr+1;
      end
    end
  end
  assign empty=(rptr==wptr);
  assign full=((wptr+1'b1)==rptr);
endmodule
