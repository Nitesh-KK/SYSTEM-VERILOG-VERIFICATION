class transaction #(parameter N=5,M=32,D=$clog2(M));
  bit rst;
  bit re;
  bit we;
  rand bit [N-1:0] din;
  bit full;
  bit empty;
  bit [N-1:0] dout;
  
  function void display(string str);
    $display("%s",str);
    $display("Time=%0t\t rst=%b\t re=%b\t we=%b\t din=%0d\t full=%b\t empty=%b\t dout=%0d",$time,rst,re,we,din,full,empty,dout);
  endfunction
endclass  
