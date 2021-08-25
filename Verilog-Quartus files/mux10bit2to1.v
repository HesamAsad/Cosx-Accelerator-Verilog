module mux10bit2to1(input [9:0]a,b,input sel1,sel2,output [9:0]c);
	assign c = sel1 ? a : (sel2 ? b : 10'bz);
endmodule
