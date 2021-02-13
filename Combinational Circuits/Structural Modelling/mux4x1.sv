// Design (design.sv)//
`timescale 1ns/1ps
module mux4x1(i0,i1,i2,i3,s,o);
  input i0,i1,i2,i3;
  input [1:0]s;
  output o;
  wire nots0,nots1,w,x,y,z;
  not(nots0,s[0]);
  not(nots1,s[1]);
  and(w,nots1,nots0,i0);
  and(x,nots1,s[0],i1);
  and(y,s[1],nots0,i2);
  and(z,s[1],s[0],i3);
  or(o,w,x,y,z);
  
endmodule

// Testbench (testbench.sv)//
`timescale 1ns/1ps
module mux4x1tb;
 reg i0,i1,i2,i3;
  reg [1:0]s;
 wire o;
  mux4x1 uut1 (.i0(i0),
               .i1(i1),
               .i2(i2),
               .i3(i3),
               .s(s),
               .o(o));
    
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);    
    i0=0;
    i1=1;
    i2=0;
    i3=1;
    s=2'b10;
    #100
    i0=0;
    i1=0;
    i2=1;
    i3=0;
    s=2'b10;
    #100
    $finish;  
  end  
endmodule
