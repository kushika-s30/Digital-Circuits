module jkff(input j,k,clk,rst,output reg q,qb);
  reg[1:0] jk;
  always@(posedge clk,posedge rst)
    begin 
      jk={j,k};
      if(rst==0)
        begin
          case(jk)
            2'd1:q=1'b0;
            2'd2:q=1'b1;
            2'd3:q=~q;
            default: begin end
          endcase
        end
      else
        begin
          q=1'b0;
        end
      qb=~q;
    end
endmodule

module jkfftb;
  reg [1:0] jk;
  reg j,k,clk,rst;
  wire q,qb;
  
jkff uut (.q(q),
          .qb(qb), 
          .j(j),
          .k(k),
          .clk(clk),
          .rst(rst));

 initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
   
  j  = 1'b0;
  k  = 1'b0;
  clk = 1'b0;
  rst = 1'b1;
  #100;
  rst   = 1'b0;
  #400
   
  $finish;  
  end

always #40 j= ~j;
always #60 k= ~k;
always #10 clk = ~clk;   
endmodule
