// Design (design.sv)//
`timescale 1ns/1ps
module encoder8x3(i,d);
  input [7:0]i;
  output reg [2:0]d;
  always@(i) begin    
   d[0]=(i[1])|(i[3])|(i[5])|(i[7]);
   d[1]=(i[2])|(i[3])|(i[6])|(i[7]);
   d[2]=(i[4])|(i[5])|(i[6])|(i[7]);
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
    
    i=8'b00000001;   #100
    i=8'b00000010;   #100
    i=8'b00000100;   #100
    i=8'b00001000;   #100
    i=8'b00010000;   #100
    i=8'b00100000;   #100
    i=8'b01000000;   #100
    i=8'b10000000;   #100
    
    $finish;  
  end  
endmodule
