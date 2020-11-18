module DMLS(a,b,c,g,y);
  input a,b,g;
  input [3:0]c;
  output y;
  wire and1;
  assign and1 = (~g)&c[0]&(~b)&(~a);
  assign and2 = (~g)&c[1]&(~b)&(a);
  assign and3 = (~g)&c[2]&(b)&(~a);
  assign and4 = (~g)&c[3]&(b)&(a);
  or(y,and1,and2,and3,and4);
endmodule

module DMLStb;
  reg a,b,g;
  reg [3:0]c;
  wire y;
  
  DMLS uut(.a(a),
           .b(b),
           .c(c),
           .g(g),
           .y(y));
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    g=1;
    b=0;
    a=0;
    c=4'b0000; #25    
    c=4'b0001; #25
    c=4'b1001; #25
    c=4'b0110; #25
    c=4'b1000; #25
    c=4'b1101; #25
    c=4'b0010; #25
    c=4'b1111; #25
    c=4'b0000; #25    
    c=4'b0001; #25
    c=4'b1001; #25
    c=4'b0110; #25
    c=4'b1000; #25
    c=4'b1101; #25
    c=4'b0010; #25
    c=4'b1111; #25  
    
     $finish;  
  end 
  always #100 b=~b;
  always #50 a=~a;
  always #200 g=~g;
endmodule
