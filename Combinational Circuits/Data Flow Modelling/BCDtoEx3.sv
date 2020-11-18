module BCDtoEx3(input a,b,c,d,output w,x,y,z);
  assign w =a|(b&c)|(b&d);
  assign x= ((~b)&c)|((~b)&d)|(b&(~c)&(~d));
  assign y= c~^d;
  assign z= ~d;
endmodule

module BCDtoEx3tb;
  reg a,b,c,d;
  wire w,x,y,z;
  BCDtoEx3 uut1 (.a(a),.b(b),.c(c),.d(d),
                 .w(w),.y(y),.x(x),.z(z));
    
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    {a,b,c,d}=4'b0000;    #100
    {a,b,c,d}=4'b1001;    #100
    {a,b,c,d}=4'b0010;    #100
    {a,b,c,d}=4'b1011;    #100
    {a,b,c,d}=4'b0100;    #100
    {a,b,c,d}=4'b1101;    #100
    {a,b,c,d}=4'b0110;    #100
    {a,b,c,d}=4'b1111;    #100 
       
    $finish;  
  end  
endmodule
