module reg10(input clk, rst, ldx, ld1, input[9:0] in, output reg[9:0] out);
	always @(posedge clk,posedge rst) begin
		if (rst) out<=10'b0;
		else if(ld1) out<=10'b0100000000;
		else if(ldx) out<=in;
		else out <= out;
	end
endmodule
