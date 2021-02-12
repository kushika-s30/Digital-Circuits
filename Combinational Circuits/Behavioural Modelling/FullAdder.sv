// Design (design.sv)//
`timescale 1ns/1ps 
module FullAdd( input a, input b,input cin, output sum, output cout); 
  reg sum,cout;
  always@(a,b,cin) begin
  sum=(a^b)^cin;
  cout=(a&b)|((a^b)&cin);
  end
endmodule

//Testbench(testbench.sv)//
`timescale 1ns/1ps 
module FAdd; 
 reg a; 
 reg b; 
 reg cin;
 wire sum,cout; 
 FullAdd uut1 (.a(a),
               .b(b), 
               .cin(cin), 
               .sum(sum),
               .cout(cout)); 
initial begin 
 $dumpfile("dump.vcd"); 
 $dumpvars(1); 
               a=0; 
               b=0;
               cin=0;
               #100
               a=0; 
               b=0;
               cin=1;
               #100
               a=0; 
               b=1;
               cin=0;
               #100
               a=0; 
               b=1;
               cin=1;
               #100 
               a=1; 
               b=0;
               cin=0;
               #100 
               a=1; 
               b=0;
               cin=1;
               #100
               a=1; 
               b=1;
               cin=0;
               #100
               a=1; 
               b=1;
               cin=1;
               #100 
               $finish; 
               end 
endmodule
