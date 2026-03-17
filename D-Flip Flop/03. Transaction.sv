class transaction;
  bit rst;
  rand bit d;
  bit q;
  
  function void display(string str);
    $display("%s",str);
    $display("Time=%0t\t reset=%b\t d=%b\t q=%b",$time,rst,d,q);
  endfunction
endclass
