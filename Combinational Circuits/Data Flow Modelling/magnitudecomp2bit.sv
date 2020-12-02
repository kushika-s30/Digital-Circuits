// Design (design.sv)//
`timescale 1ns/1ps
module magnitudecomp2bit(a0,a1,b0,b1,c0,c1,c2);
  input a0,a1,b0,b1;
  output c0,c1,c2;
  assign c0=(a1&(~b1))|((a0)&(~b1)&(~b0))|(a1&a0&(~b0));
  assign c1=(a0~^b0)&(a1~^b1);
  assign c2=((~a1)&b1)|((~a0)&b1&b0)|((~a1)&(~a0)&b0);  
endmodule

// Testbench (testbench.sv)//
`timescale 1ns/1ps
module magnitudecomp2bittb;
  reg a0,a1,b0,b1;   
  wire c0,c1,c2;
  magnitudecomp2bit uut1 (.a0(a0),
                          .a1(a1),
                          .b0(b0),
                          .b1(b1),
                          .c0(c0),
                          .c1(c1),
                          .c2(c2));
    
  initial begin   
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    a1=0;a0=0;b1=0;b0=0;    #100
    a1=0;a0=0;b1=0;b0=1;    #100
    a1=0;a0=0;b1=1;b0=0;    #100
    a1=0;a0=0;b1=1;b0=1;    #100
    a1=0;a0=1;b1=0;b0=0;    #100
       
    $finish;  
  end  
endmodule


