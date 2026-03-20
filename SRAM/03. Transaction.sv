class transaction #(parameter N=5,M=32);
  bit rst;
  rand bit en;
  rand bit [N-1:0] din;
  rand bit [$clog2(M)-1:0] addr;
  bit [N-1:0] dout;
  
  constraint eqen { en dist {1:=50,0:=50};
                  }
  
  function void display(string str);
    $display("%s",str);
    $display("time=%0t\trst=%b\t en=%b\t din=%0d\t addr=%0d\t dout=%0d",$time,rst,en,din,addr,dout);
  endfunction
endclass
