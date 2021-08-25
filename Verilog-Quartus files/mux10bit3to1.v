module mux10bit3to1(input [9:0]a,b,c, input sel1,sel2, sel3, output [9:0]d);
	assign d = sel1 ? a : (sel2 ? b : (sel3 ? c : 10'bz));
endmodule
