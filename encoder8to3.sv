// Design (design.sv)//
`timescale 1ns/1ps
module encoder8x3(i,en,d);
  input [7:0]i;
  input en;
  output [2:0]d;
  if (en == 1) begin
  assign d[0]=(i[1])|(i[3])|(i[5])|(i[7]);
  assign d[1]=(i[2])|(i[3])|(i[6])|(i[7]);
  assign d[2]=(i[4])|(i[5])|(i[6])|(i[7]);
  end
  else begin
    d=3'b000;
  end
endmodule


// Testbench (testbench.sv)//
`timescale 1ns/1ps
module encoder8x3tb;
  reg [7:0]i;
  wire [2:0]d;
  encoder8x3 uut1 (.i(i),
               .d(d));
    
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    i=8'b00000001; en=0  #100
    i=8'b00000010; en=0  #100
    i=8'b00000100; en=0  #100
    i=8'b00001000; en=0  #100
    i=8'b00010000; en=0  #100
    i=8'b00100000; en=0  #100
    i=8'b01000000; en=0  #100
    i=8'b10000000; en=0  #100
    
    i=8'b00000001; en=1  #100   
    i=8'b00000010; en=1  #100
    i=8'b00000100; en=1  #100
    i=8'b00001000; en=1  #100
    i=8'b00010000; en=1  #100
    i=8'b00100000; en=1  #100
    i=8'b01000000; en=1  #100
    i=8'b10000000; en=1  #100
    
    
    
    $finish;  
  end  
endmodule
