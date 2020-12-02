// Design (design.sv)//
`timescale 1ns/1ps
module demux1x4(i,s,d0,d1,d2,d3);
  input i;
  input [1:0]s;
  output d0,d1,d2,d3;
  assign d0=(~s[1])&(~s[0])&i;
  assign d1=(~s[1])&s[0]&i;
  assign d2=s[1]&(~s[0])&i;
  assign d3=s[1]&s[0]&i;
endmodule


// Testbench (testbench.sv)//
`timescale 1ns/1ps
module demux1x4tb;
 reg i;
  reg [1:0]s;
 wire d0,d1,d2,d3;
  demux1x4 uut1 (.d0(d0),
               .d1(d1),
               .d2(d2),
               .d3(d3),
               .i(i),
               .s(s));
    
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    i=1;
    s=2'b10;
    #100
    i=1;
    s=2'b11;
    #100
    
    $finish;  
  end  
endmodule
