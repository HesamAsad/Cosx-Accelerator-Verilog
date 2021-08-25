`timescale 1ps/1ps
module CUTB();
  wire done, ldx_x, ldx_x2, ldx_t, ldx_r, ld1_x, ld1_x2, ld1_t, ld1_r, 
		selx_2to1, selx_3to1, selx2, selt, selrom, seladd;
  wire[2:0] addr;
  logic clk = 1'b0,rst,start=1'b0,lt = 1'b0;
  controller cosCU(clk, rst, start, lt, done, ldx_x, ldx_x2, ldx_t, ldx_r, ld1_x, ld1_x2, ld1_t, ld1_r, 
		selx_2to1, selx_3to1, selx2, selt, selrom, seladd, addr);
  always #12000 clk = ~clk;
  initial begin
    rst=1;
    #24000 rst=0;
    #12020 start=1;
    #24040 start=0;
  end
  initial begin 
    #700000 rst=1;
    #24000 rst=0;
    #12020 start=1;
    #24040 start=0;
  end
  initial begin 
    #1440000 rst=1;
    #24000 rst=0;
    #12020 start=1;
    #24040 start=0;
  end
  initial #2400000 $stop;
endmodule
