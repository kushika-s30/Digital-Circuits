// Design (design.sv)//
`timescale 1ns/1ps
module ROM(out,addr,CS);
  input [2:0]addr;
  input CS;
  output [7:0]out;
  reg [7:0] out;
  reg [7:0] ROM[7:0];
  always@(negedge CS,addr)
    begin
      ROM[0]=8'o106;ROM[4]=8'o222;
      ROM[1]=8'o120;ROM[5]=8'o260;
      ROM[2]=8'o147;ROM[6]=8'o321;
      ROM[3]=8'o161;ROM[7]=8'o377;
      out=ROM[addr];
    end
endmodule

// Testbench (testbench.sv)//
`timescale 1ns/1ps
module ROMtb;
  reg [2:0]addr;
  reg CS;
  wire [7:0]out;
  ROM uut1 (.addr(addr),
            .out(out),
            .CS(CS));
    
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    CS=0;
    addr=3'b000;    
    #100 
    CS=0;
    addr=3'b001;    
    #100 
    CS=0;
    addr=3'b010;    
    #100 
    CS=0;
    addr=3'b011;    
    #100 
    CS=0;
    addr=3'b100;    
    #100
    CS=0;
    addr=3'b101;    
    #100 
    CS=0;
    addr=3'b110;    
    #100 
    CS=0;
    addr=3'b111;    
    #100 
       
    $finish;  
  end  
endmodule
