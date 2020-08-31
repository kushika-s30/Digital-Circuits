// Design (design.sv)//
`timescale 1ns/1ps
module half_adder(x,y,s,c);
  input x,y;
  output s,c;
  xor(s,x,y);
  and(c,x,y);
endmodule

module full_adder(a,b,cin,s,cout);
  input a,b,cin;
  output s,cout;
  wire s1,c1,c2;
  half_adder ha_1(a,b,s1,c1);
  half_adder ha_2(cin,s1,s,c2);
  or(cout,c1,c2);
endmodule


// Testbench (testbench.sv)//
`timescale 1ns/1ps
module FA;
  reg a;
  reg b;
  reg cin;
  
  wire s,cout;
  full_adder uut1 (.a(a),
                   .b(b),
           .cin(cin),
           .s(s),
          .cout(cout));
    
  initial begin  
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    a=0;
    b=0;
    cin=0;
    #100
    a=0;
    b=0;
    cin=1;
    #100
    a=0;
    b=1;
    cin=0;
    #100
    a=0;
    b=1;
    cin=1;
    #100
    a=1;
    b=0;
    cin=0;
    #100
    a=1;
    b=0;
    cin=1;
    #100
    a=1;
    b=1;
    cin=0;
    #100
    a=1;
    b=1;
    cin=1;
    #100
    $finish;  
  end  
endmodule
