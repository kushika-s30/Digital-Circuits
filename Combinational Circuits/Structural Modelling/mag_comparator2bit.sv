// Design (design.sv)//
`timescale 1ns/1ps
module magnitudecomp2bit(a0,a1,b0,b1,c0,c1,c2);
  input a0,a1,b0,b1;
  output c0,c1,c2;
  wire nota0,nota1,notb0,notb1,p1,p2,p3,q1,q2,r1,r2,r3;
  
  not(nota0,a0);not(nota1,a1);not(notb0,b0);not(notb1,b1);
  
  and(p1,a1,notb1);and(p2,a0,notb1,notb0);and(p3,a1,a0,notb0);
  or(c0,p1,p2,p3);
  
  xnor(q1,a0,b0);xnor(q2,a1,b1);
  and(c1,q1,q2);
  
  and(r1,nota1,b1);and(r2,nota0,b1,b0);and(nota1,nota0,b0);
  or(c2,r1,r2,r3);
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



