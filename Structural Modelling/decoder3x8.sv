// Design (design.sv)//
`timescale 1ns/1ps
module decoder3x8(input [2:0]i,output [7:0]d);
  wire noti0,noti1,noti2;
  not(noti0,i[0]);
  not(noti1,i[1]);
  not(noti2,i[2]);
  and(d[0],noti2,noti1,noti0);
  and(d[1],noti2,noti1,i[0]);
  and(d[2],noti2,i[1],noti0);
  and(d[3],noti2,i[1],i[0]);
  and(d[4],i[2],noti1,noti0);
  and(d[5],i[2],noti1,i[0]);
  and(d[6],i[2],i[1],noti0);
  and(d[7],i[2],i[1],i[0]);  
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
