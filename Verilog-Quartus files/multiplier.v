module multiplier(input [9:0]a,b,output [9:0]out);
  wire [9:0]dummy;
  assign {dummy[9:8],out,dummy[7:0]} = a*b; //a*b[17..8]
endmodule
