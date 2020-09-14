// Design (design.sv)//
`timescale 1ns/1ps
module magnitudecomp2bit(a,b,c0,c1,c2);
  input [1:0]a,b;
  output c0,c1,c2;
  reg c0,c1,c2;
  
  always@(a or b)
    begin 
      if(a==b)
        begin 
          c0=0;
          c1=1;
          c2=0;
        end
      else if(a>b)
        begin 
          c0=1;
          c1=0;
          c2=0;
        end
      else if(a<b)
        begin
          c0=0;
          c1=0;
          c2=1;
        end
    end
endmodule

/ Testbench (testbench.sv)//
`timescale 1ns/1ps
module magnitudecomp2bittb;
  reg [1:0]a,b;
  wire c0,c1,c2;
  magnitudecomp2bit uut1 ( .a(a),
                          .b(b),
                          .c0(c0),
                          .c1(c1),
                          .c2(c2));
    
  initial begin   
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    a[1]=0;a[0]=0;b[1]=0;b[0]=0;    #100
    a[1]=0;a[0]=0;b[1]=0;b[0]=1;    #100
    a[1]=0;a[0]=0;b[1]=1;b[0]=0;    #100
    a[1]=0;a[0]=0;b[1]=1;b[0]=1;    #100
    a[1]=0;a[0]=1;b[1]=0;b[0]=0;    #100
       
    $finish;  
  end  
endmodule
