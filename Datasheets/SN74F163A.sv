module FF(Q1,Q2,
          r,te,clk,d,load);
  
  output Q1,Q2;
  input r,te,clk,d,load;  
  wire xnor1,xnor2;
  wire nand1,nand2,nand3,nand4,nand5,nand6;
  wire and1,and2,and3,and4;
  wire q,qbar,clk_not;  
  
  xnor(xnor1,qbar,te);
  xnor(xnor2,te,q);
  nand(nand1,d,load);
  nand(nand2,nand1,load);
  and(and1,xnor1,nand4);
  and(and2,nand3,r,xnor2);
  and(and3,and1,nand1);
  and(and4,and2,nand2);
  not(clk_not,clk);
  nand(nand3,and3,clk_not);
  nand(nand4,clk_not,and4);
  nand(nand5,nand3,qbar);
  nand(nand6,q,nand4);
  nand(Q1,q,nand4);
  nand(Q2,q,nand4);
  
endmodule


module counter4bit(clr,load,ent,enp,clk,a,b,c,d,
                   Qa,Qb,Qc,Qd,rco); 
  input clr,load,ent,enp,clk,a,b,c,d;
  output Qa,Qb,Qc,Qd,rco;
  wire nand1,nand2;
  wire and1,and2,and3,and4,and5;
  wire load_not,nand1_not,nand2_not;
  wire Qa2,Qb2,Qc2,Qd2;
  //nand gate 1
  nand(nand1,enp,ent,load,clr);  
  
  //and gate 1
  not(load_not,load);  
  and(and1,clr,load_not); 
  
  //and gate 2
  not(nand1_not,nand1);
  and(and2,Qa2,nand1_not); 
  
  //and gate 3
  and(and3,Qb2,Qa2,nand1_not);
  
  //and gate 4 
  nand(nand2,Qc2,Qb2); //nand gate 2 
  not(nand2_not,nand2);
  and(and5,nand1_not,nand2_not); //and gate 5
  and(and4,Qa2,and5); //and gate 4  
  
  //Flip flop 1
  FF ff1(Qa,Qa2, 
           clr,nand1_not,clk,a,and1); 
  
  //Flip flop 2
  FF ff2(Qb,Qb2,
           clr,and2,clk,b,and1);
  
  //Flip flop 3
  FF ff3(Qc,Qc2,
           clr,and3,clk,c,and1);
  
  //Flip flop 4
  FF ff4(Qd,Qd2,
          clr,and4,clk,d,and1);
  
  //and gate 6
  and(rco,Qa2,Qb2,Qc2,Qd2);

endmodule

//TEST FIXTURE
module counter_tb;
 reg clr,load,ent,enp,clk,a,b,c,d;
  wire Qa,Qb,Qc,Qd,rco;   
 
  counter4bit uut (
    .Qa(Qa),.Qb(Qb),.Qc(Qc),.Qd(Qd),.rco(rco),
    .clr(clr),.load(load),.ent(ent),.enp(enp),.clk(clk),
    .a(a),.b(b),.c(c),.d(d)); 
    
  initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
    
    clr=0;load=0;a=0;b=0;c=0;d=0;clk=0;enp=0;ent=0; #30
    clr=1;load=1;a=1;b=1;c=1;d=1;clk=1;enp=1;ent=1; #30 
   
   
  $finish;  
  end

always #10 clk = ~clk;   
endmodule
