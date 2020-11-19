//Design.sv//
module half_adder(a,b,s,c);
  assign s=a^b;
  assign c=a&b;
endmodule

//Testbench.sv//
module half_adderuut;
  reg a,b;
  wire s,c;
  half_adder uut(.a(a),
                 .b(b),
                 .s(s),
                 .c(c));
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
