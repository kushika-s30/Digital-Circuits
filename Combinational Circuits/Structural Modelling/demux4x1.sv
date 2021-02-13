// Design (design.sv)//
`timescale 1ns/1ps
module demux1x4(i,s,d0,d1,d2,d3);
  input i;
  input [1:0]s;
  output d0,d1,d2,d3;
  wire nots0,nots1;
  not(nots0,s[0]);
  not(nots1,s[1]);
  and(d0,nots1,nots0,i);
  and(d1,nots1,s[0],i);
  and(d2,s[1],nots0,i);
  and(d3,s[1],s[0],i);
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
