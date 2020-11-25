//Design.sv//
module half_sub(input a,b,output d,b1);
  
assign d=a^b;
assign b1=(~a)&b;
  
endmodule

//Testbench.sv//
module half_subuut;
  reg a,b;
  wire d,b1;
  half_sub uut(.a(a),
                 .b(b),
                 .d(d),
                 .b1(b1));
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    a=0;b=0; #100
    a=0;b=1; #100
    a=1;b=0; #100
    a=1;b=1; #100
     
    $finish; 
  end 
endmodule 

