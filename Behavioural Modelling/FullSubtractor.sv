// Design (design.sv)//
module full_sub( input a, input b,input cin, output d, output cout); 
 reg d,cout;
  always@(a,b,cin) begin
    d=(a^b)^cin;
    cout=cin&(~(a^b))|(~a)&b;
  end
endmodule

//Testbench(testbench.sv)//

module FSub; 
 reg a; 
 reg b; 
 reg cin;
 wire d,cout; 
 full_sub uut1 (.a(a),
               .b(b), 
               .cin(cin), 
               .d(d),
               .cout(cout)); 
initial begin 
 $dumpfile("dump.vcd"); 
 $dumpvars(1); 
               a=0; 
               b=0;
               cin=0;
               #100
               a=0; 
               b=0;
               cin=1;
               #100
               a=0; 
               b=1;
               cin=0;
               #100
               a=0; 
               b=1;
               cin=1;
               #100 
               a=1; 
               b=0;
               cin=0;
               #100 
               a=1; 
               b=0;
               cin=1;
               #100
               a=1; 
               b=1;
               cin=0;
               #100
               a=1; 
               b=1;
               cin=1;
               #100 
               $finish; 
               end 
endmodule
