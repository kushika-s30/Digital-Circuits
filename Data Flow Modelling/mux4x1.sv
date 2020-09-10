// Design (design.sv)//
`timescale 1ns/1ps
module mux4x1(i0,i1,i2,i3,s,o);
  input i0,i1,i2,i3;
  input [1:0]s;
  output o;
  assign o = ((~s[1])&(~s[0])&(i0))|((~s[1])&s[0]&i1)|(s[1]&(~s[0])&i2)|(s[1]&s[0]&i3);
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
