// Design (design.sv)//
`timescale 1ns/1ps
module encoder8x3(i,d);
  input [7:0]i;
  output [2:0]d;
  assign d[0]=(i[1])|(i[3])|(i[5])|(i[7])|(~i[0])|(~i[2])|(~i[4])|(~i[6]);
  assign d[1]=(i[2])|(i[3])|(i[6])|(i[7])|(~i[0])|(~i[1])|(~i[4])|(~i[5]);
  assign d[2]=(i[4])|(i[5])|(i[6])|(i[7])|(~i[0])|(~i[1])|(~i[2])|(~i[3]);
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
    
    i=8'b10000000;
    #100
    i=8'b00000010;
    #100
    
    $finish;  
  end  
endmodule
