module add_sub(input seladd, input[9:0]a,b,output [9:0]c);
  wire co;
  assign {co,c} = seladd ? a+b : a-b;
endmodule
