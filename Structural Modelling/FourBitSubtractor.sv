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

module FourBitSub(a,b,cin,d,cout);
  input [3:0]a,b;
  input cin;
  output [3:0]d;
  output cout;
  wire c1,c2,c3;
  full_sub fs1(a[0],b[0],cin,d[0],c1);
  full_sub fs2(a[1],b[1],c1,d[1],c2);
  full_sub fs3(a[2],b[2],c2,d[2],c3);
  full_sub fs4(a[3],b[3],c3,d[3],cout);
endmodule

//Testbench(testbench.sv)//
`timescale 1ns/1ps 
module FBSub; 
  reg [3:0]a,b;
  reg cin;
  wire [3:0]d;
  wire cout;
  
 FourBitSub uut1 (.a(a),
               .b(b), 
               .cin(cin), 
                  .d(d),
               .cout(cout)); initial begin 
 $dumpfile("dump.vcd"); 
 $dumpvars(1); 
  a=4'b1011;
  b=4'b1111;
  cin=1'b0;
  #100
  $finish; 
  end 
endmodule
