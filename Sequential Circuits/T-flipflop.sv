// Design.sv//
module TFF( Q,Qbar,T,Clk,Reset);
output reg Q; 
output Qbar; 
input T,Clk,Reset; 

assign Qbar = ~Q; 

always @(posedge Clk)
begin 
 if (Reset == 1'b1) 
  Q <= 1'b0;
 else 
  if(T) 
     Q <= ~ Q;
end 
endmodule


//Testbench.sv//
module TFF_tb;
reg T;
reg Clk;
reg Reset;

wire Q;
wire Qbar;

  TFF uut (.Q(Q), 
           .Qbar(Qbar), 
           .T(T), 
           .Clk(Clk), 
           .Reset(Reset)
          );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);

     T  = 1'b0;
     Clk  = 1'b0;
     Reset   = 1'b1;  
     #100;
     Reset = 1'b0;
     #400;
    
    $finish; 
	end
always #10 Clk = ~Clk;
always #40 T = ~ T;
endmodule
