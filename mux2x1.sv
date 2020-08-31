// Design (design.sv)//
`timescale 1ns/1ps
module mux2x1(i0,i1,s,o);
  input i0,i1,s;
  output o;
  reg o;
  always@(i0,i1,s)
    begin
      if(s==0)
        o=i0;
      else
        o=i1;
    end
endmodule

// Testbench (testbench.sv)//
`timescale 1ns/1ps
module mux2x1tb;
 reg i0,i1,s;
 wire o;
  mux2x1 uut1 (.i0(i0),
               .i1(i1),
               .s(s),
               .o(o));
    
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);    
    i0=0;
    i1=1;
    s=1;
    #100
    i0=0;
    i1=1;
    s=0;
    #100
    i0=1;
    i1=0;
    s=0;
    #100
    i0=1;
    i1=0;
    s=1;
    #100
    $finish;  
  end  
endmodule
