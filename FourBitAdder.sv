// Design (design.sv)//
`timescale 1ns/1ps
module half_adder(x,y,s,c);
  input x,y;
  output s,c;
  xor(s,x,y);
  and(c,x,y);
endmodule

module full_adder(a,b,cin,s,cout);
  input a,b,cin;
  output s,cout;
  wire s1,c1,c2;
  half_adder ha_1(a,b,s1,c1);
  half_adder ha_2(cin,s1,s,c2);
  or(cout,c1,c2);
endmodule

module four_bit_adder(x,y,cin,sum,cout);
  input[3:0]x,y;
  input cin;
  output [3:0]sum;
  output cout;
  wire c1,c2,c3;
  full_adder fa_1(x[0],y[0],cin,sum[0],c1);
  full_adder fa_2(x[1],y[1],c1,sum[1],c2);
  full_adder fa_3(x[2],y[2],c2,sum[2],c3);
  full_adder fa_4(x[3],y[3],c3,sum[3],cout);
endmodule


// Testbench (testbench.sv)//
`timescale 1ns/1ps
module FourbitAdd;
  reg cin;
  reg [3:0]x,y;  
  wire [3:0]sum;
  wire cout;
  four_bit_adder uut1 (.x(x),
                       .y(y),
           			.cin(cin),
                       .sum(sum),
          			.cout(cout));
    
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);    
    x=4'b1011;
    y=4'b1111;
    cin=1'b0;
    #100
    $finish;  
  end  
endmodule
