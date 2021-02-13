// Design (design.sv)//
`timescale 1ns/1ps
module half_sub(x,y,d,b);
  input x,y;
  output d,b;
  wire notx;
  xor(d,x,y);
  not(notx,x);
  and(b,notx,y);
endmodule

module full_sub(a,b,cin,d,cout);
  input a,b,cin;
  output d,cout;
  wire d1,c1,c2;
  half_sub hs_1(a,b,d1,c1);
  half_sub hs_2(d1,cin,d,c2);
  or(cout,c2,c1);
endmodule

//Testbench(testbench.sv)//
`timescale 1ns/1ps 
module FSub; 
 reg a; 
 reg b; 
 reg cin;
 wire d,cout; 
 full_sub uut1 (.a(a),
               .b(b), 
               .cin(cin), 
               .d(d),
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
