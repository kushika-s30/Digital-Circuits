module srff(input s,r,clk,rst,output reg q,qb);
  reg[1:0] sr;
  always@(posedge clk)
    begin 
      sr={s,r};
      if(rst==0)
        begin
          case(sr)
            2'd1:q=1'b0;
            2'd2:q=1'b1;
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

module srfftb;
  reg [1:0] sr;
  reg s,r,clk,rst;
  wire q,qb;
  
srff uut (.q(q),
          .qb(qb), 
          .s(s),
          .r(r),
          .clk(clk),
          .rst(rst));

 initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
   
  s  = 1'b0;
  r  = 1'b0;
  clk = 1'b0;
  rst = 1'b1;
  #100;
  rst   = 1'b0;
  #400
   
  $finish;  
  end

always #40 s= ~s;
always #60 r= ~r;
always #10 clk = ~clk;   
endmodule
