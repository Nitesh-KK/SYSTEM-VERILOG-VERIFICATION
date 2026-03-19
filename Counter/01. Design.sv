module counter(
  input clk,rst,up,
  output reg [5:0] count
);
  always @(posedge clk) begin
    if(rst) count<=0;
    else if(up) count<=count+1;
    else count<=count-1;
  end
endmodule
