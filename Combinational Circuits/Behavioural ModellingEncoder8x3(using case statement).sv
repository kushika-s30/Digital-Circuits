`timescale 1ns/1ps
module encoder8x3(i,d);
  input [7:0]i;
  output [2:0]d;
  reg d;
  always@(i) begin
  case(i)
    8'b00000001:begin
      d=000;
    end
    8'b00000010:begin
      d=001;
    end
    8'b00000100:begin
      d=010;
    end
    8'b00001000:begin
      d=011;
    end
    8'b00010000:begin
      d=100;
    end
    8'b00100000:begin
      d=101;
    end
    8'b01000000:begin
      d=110;
    end
    8'b10000000:begin
      d=111;
    end
  endcase
end
endmodule

// Testbench (testbench.sv)//
`timescale 1ns/1ps
module encoder8x3tb;
  reg [7:0]i;
  wire [2:0]d;
  encoder8x3 uut1 (.i(i),
               .d(d));
    
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    i=8'b00000001;   #100
    i=8'b00000010;   #100
    i=8'b00000100;   #100
    i=8'b00001000;   #100
    i=8'b00010000;   #100
    i=8'b00100000;   #100
    i=8'b01000000;   #100
    i=8'b10000000;   #100
    
    $finish;  
  end  
endmodule
