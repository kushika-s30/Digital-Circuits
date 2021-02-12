// Design (design.sv)//
`timescale 1ns/1ps 
module FourBitAdd(a,b,cin,s,cout);
  input [3:0]a,b;
  input cin;
  output [3:0]s;
  output cout;
  reg [3:0]s;
  reg cout;  
  
  always@(a,b,cin) begin
  
  s[0]=(a[0]^b[0])^cin;    

  s[1]=(a[1]^b[1])^((a[0]&b[0])|((a[0]^b[0])&cin));
    
  s[2]=(a[2]^b[2])^((a[1]&b[1])|((a[1]^b[1])&((a[0]&b[0])|((a[0]^b[0])&cin))));
   
  s[3]=(a[3]^b[3])^((a[2]&b[2])|((a[2]^b[2])&((a[1]&b[1])|((a[1]^b[1])&((a[0]&b[0])|((a[0]^b[0])&cin))))));
  
  cout=(a[3]&b[3])|((a[3]^b[3])&((a[2]&b[2])|((a[2]^b[2])&((a[1]&b[1])|((a[1]^b[1])&((a[0]&b[0])|((a[0]^b[0])&cin)))))));
  
  end
  
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
