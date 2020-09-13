// Design (design.sv)//
`timescale 1ns/1ps
module decoder3x8(input [2:0]i,output [7:0]d);
  reg d;
  always@(i) begin
    case(i)
      3'b000:begin
        d=8'b00000001;
      end
      3'b001:begin
        d=8'b000000010;
      end
      3'b010:begin
        d=8'b00000100;
      end
      3'b011:begin
        d=8'b00001000;
      end
      3'b100:begin
        d=8'b00010000;
      end
      3'b101:begin
        d=8'b00100000;
      end
      3'b110:begin
        d=8'b01000000;
      end
      3'b111:begin
        d=8'b10000000;
      end
    endcase
  end
endmodule

// Testbench (testbench.sv)//
`timescale 1ns/1ps
module decoder3x8tb;
  reg [2:0]i;
  wire [7:0]d;
  decoder3x8 uut1 (.i(i),
               .d(d));
    
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    i=3'b000;    #100
    i=3'b001;    #100
    i=3'b010;    #100
    i=3'b011;    #100
    i=3'b100;    #100
    i=3'b101;    #100
    i=3'b110;    #100
    i=3'b111;    #100    
    $finish;  
  end  
endmodule
