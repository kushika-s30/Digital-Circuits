// Design (design.sv)//
`timescale 1ns/1ps
module mux4x1(i0,i1,i2,i3,s,o);
  input i0,i1,i2,i3;
  input [1:0]s;
  output o;
  reg o;
  always@(i0,i1,i2,i3,s)
    begin
      case(s)
        2'b00:begin
          	  o=i0;
        end
        2'b01:begin
          	  o=i1;
        end
        2'b10:begin
          	  o=i2;
        end
        2'b11:begin
          	  o=i3;
        end
      endcase
    end
endmodule

// Testbench (testbench.sv)//
`timescale 1ns/1ps
module mux4x1tb;
 reg i0,i1,i2,i3;
  reg [1:0]s;
 wire o;
  mux4x1 uut1 (.i0(i0),
               .i1(i1),
               .i2(i2),
               .i3(i3),
               .s(s),
               .o(o));
    
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);    
    i0=0;
    i1=1;
    i2=0;
    i3=1;
    s=2'b10;
    #100
    i0=0;
    i1=0;
    i2=1;
    i3=0;
    s=2'b10;
    #100
    $finish;  
  end  
endmodule
