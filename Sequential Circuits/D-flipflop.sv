//Design.sv//
module DFF( Q,Qbar,D,Clk,Reset);
output  reg  Q; 
output   Qbar; 
input   D,Clk,Reset; 
assign Qbar = ~Q; 
always @(posedge Clk) 
begin  
 if (Reset == 1'b1)
  Q <= 1'b0;
 else 
  Q <= D;
end 
endmodule

//Testbench.sv//
module DFF_tb;
 reg D,Clk,Reset;
 wire Q,Qbar;
 DFF uut (
  .Q(Q), 
  .Qbar(Qbar), 
  .D(D), 
  .Clk(Clk), 
  .Reset(Reset)
  );

 initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
   
  D  = 1'b0;
  Clk  = 1'b0;
  Reset   = 1'b1;
  #100;
  Reset   = 1'b0;
  #400
   
  $finish;  
  end

always #40 D = ~D;
always #10 Clk = ~Clk;   
endmodule
