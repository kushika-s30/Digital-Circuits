// Design (design.sv)//
`timescale 1ns/1ps
module decoder3x8(input [2:0]i,output reg [7:0]d);
  always@(i) begin
  d[0]=(~i[2])&(~i[1])&(~i[0]);
  d[1]=(~i[2])&(~i[1])&(i[0]);
  d[2]=(~i[2])&(i[1])&(~i[0]);
  d[3]=(~i[2])&(i[1])&(i[0]);
  d[4]=(i[2])&(~i[1])&(~i[0]);
  d[5]=(i[2])&(~i[1])&(i[0]);
  d[6]=(i[2])&(i[1])&(~i[0]);
  d[7]=(i[2])&(i[1])&(i[0]);
  end
endmodule

// Testbench (testbench.sv)//
`timescale 1ns/1ps
module decoder3x8tb;
  reg [2:0]i;
  wire [7:0]d;
  decoder3x8 uut1 (.i(i),
               .d(d));
    
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    i=3'b000;    #100
    i=3'b001;    #100
    i=3'b010;    #100
    i=3'b011;    #100
    i=3'b100;    #100
    i=3'b101;    #100
    i=3'b110;    #100
    i=3'b111;    #100    
    $finish;  
  end  
endmodule
