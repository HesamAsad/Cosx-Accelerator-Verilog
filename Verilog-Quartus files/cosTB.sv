`timescale 1ps/1ps
module cosTB();
  reg[9:0] xBus,yBus;
  reg clk=0, rst=0, start=0;
  wire done;
  wire [9:0]RBus;
  cosx UUT(done,clk,rst,start,xBus,yBus,RBus);

  always #12000 clk = ~clk;
  initial begin
    rst=1;
    #24000 rst=0;
    #18000 xBus=10'b0100000000;yBus=10'b0000000010;
    #12020 start=1;
    #24040 start=0;
  end
  initial begin 
    #700000 rst=1;
    #24000 rst=0;
    #18000 xBus=10'b0000000111;yBus=10'b0000000001;
    #12020 start=1;
    #24040 start=0;
  end
  initial begin 
    #1440000 rst=1;
    #24000 rst=0;
    #18000 xBus=10'b0110010001;yBus=10'b0000000001;
    #12020 start=1;
    #24040 start=0;
  end
  initial #2400000 $stop;
endmodule
