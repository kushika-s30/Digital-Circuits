// Design (design.sv)//
`timescale 1ns/1ps
module Gray_to_Binary (i,o);
  output [3:0] o ;
  input [3:0] i ;
    buf(o[3],i[3]);
    xor(o[2],i[3],i[2]);
    xor(o[1],i[3],i[2],i[1]);
    xor(o[0],i[3],i[2],i[1],i[0]);
endmodule

// Testbench (testbench.sv)//
`timescale 1ns/1ps
module GtoBtb;
  reg [3:0]i;
  wire [3:0]o;
  Gray_to_Binary uut1 (.i(i),
                       .o(o));
    
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    i=4'b0000;    #100
    i=4'b1001;    #100
    i=4'b0010;    #100
    i=4'b1011;    #100
    i=4'b0100;    #100
    i=4'b1101;    #100
    i=4'b0110;    #100
    i=4'b1111;    #100    
    $finish;  
  end  
endmodule
