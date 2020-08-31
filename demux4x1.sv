// Design (design.sv)//
`timescale 1ns/1ps
module demux1x4(i,s,d0,d1,d2,d3);
  input i;
  input [1:0]s;
  output d0,d1,d2,d3;
  reg d0,d1,d2,d3;
  always@(i or s)
    begin
      case(s)
        2'b00:begin
          	  d0=i;
              d1=0;
              d2=0;
              d3=0;
        end
        2'b01:begin
              d0=0;	  
              d1=i;
              d2=0;
              d3=0;      
        end
        2'b10:begin
          		d0=0;	  
                d1=0;
                d2=i;
                d3=0; 	  
        end
        2'b11:begin
          		d0=0;	  
                d1=0;
                d2=0;
                d3=i;          	  
        end
      endcase
    end
endmodule

// Testbench (testbench.sv)//
`timescale 1ns/1ps
module demux1x4tb;
 reg i;
  reg [1:0]s;
 wire d0,d1,d2,d3;
  demux1x4 uut1 (.d0(d0),
               .d1(d1),
               .d2(d2),
               .d3(d3),
               .i(i),
               .s(s));
    
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    i=1;
    s=2'b10;
    #100
    i=1;
    s=2'b11;
    #100
    
    $finish;  
  end  
endmodule
