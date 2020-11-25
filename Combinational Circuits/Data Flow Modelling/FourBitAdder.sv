// Design (design.sv)//
`timescale 1ns/1ps 
module FourBitAdd(a,b,cin,s,cout);
  input [3:0]a,b;
  input cin;
  output [3:0]s;
  output cout;
  wire c1,c2,c3;
  
  assign s[0]=(a[0]^b[0])^cin;  
  assign c1=(a[0]&b[0])|((a[0]^b[0])&cin);

  assign s[1]=(a[1]^b[1])^c1; 
  assign c2=(a[1]&b[1])|((a[1]^b[1])&c1);

  assign s[2]=(a[2]^b[2])^c2;
  assign c3=(a[2]&b[2])|((a[2]^b[2])&c2);

  assign s[3]=(a[3]^b[3])^c3;
  assign cout=(a[3]&b[3])|((a[3]^b[3])&c3);
  
endmodule 


//Testbench(testbench.sv)//
`timescale 1ns/1ps 
module FBAdd; 
  reg [3:0]a,b;
  reg cin;
  wire [3:0]s;
  wire cout;
  
 FourBitAdd uut1 (.a(a),
               .b(b), 
               .cin(cin), 
               .s(s),
               .cout(cout)); 
initial begin 
 $dumpfile("dump.vcd"); 
 $dumpvars(1); 
  a=4'b1011;
  b=4'b1111;
  cin=1'b0;
  #100
  $finish; 
  end 
endmodule
