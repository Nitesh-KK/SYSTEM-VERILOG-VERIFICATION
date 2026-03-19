class transaction;
  bit rst;
  rand bit up;
  bit [5:0] count;
  
  constraint up_c {
    up dist {1 := 60, 0 := 40}; 
  }
  
  function void display(string str) ;
    $display("%s",str);
    $display("Time=%0t\t rst=%b\t up=%b\t count=%0d",$time,rst,up,count);
  endfunction
endclass
