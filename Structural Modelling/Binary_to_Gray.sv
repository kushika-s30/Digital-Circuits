// Design (design.sv)//
`timescale 1ns/1ps
module Binary_to_Gray (i,o);
  output [2:0] o ;
  input [2:0] i ;
  buf(o[2],i[2]);
  xor(o[1],i[2],i[1]);
  xor(o[0],i[1],i[0]);
endmodule

// Testbench (testbench.sv)//
`timescale 1ns/1ps
module BtoGtb;
  reg [2:0]i;
  wire [2:0]o;
  Binary_to_Gray uut1 (.i(i),
                       .o(o));
    
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
