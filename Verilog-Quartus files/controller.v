module controller(input clk, rst, start, lt,
		output reg done, ldx_x, ldx_x2, ldx_t, ldx_r, ld1_x, ld1_x2, ld1_t, ld1_r, 
		selx_2to1, selx_3to1, selx2, selt, selrom, seladd, output reg[2:0] addr);
		
		parameter[2:0] idle = 3'b000, init = 3'b001, beg = 3'b010, mult1 = 3'b011, 
						mult2 = 3'b100, add = 3'b101;
		wire outeven;
		reg ld1_cnt = 1'b0, cen = 1'b0, co = 1'b0;
		reg[2:0] ps, ns;
		always @(start, ps, lt, outeven, co) begin
			{done, ldx_x, ldx_x2, ldx_t, ldx_r, ld1_x, ld1_x2, ld1_t, ld1_r, 
				selx_2to1, selx_3to1, selx2, selt, selrom, seladd, ld1_cnt, cen} = 17'b0;
			case(ps)
			
				idle: begin 
					ns = start ? init : idle;
					done = 1'b1;
				end
				
				init: begin
					ldx_x = 1'b1;
					ns = start ? init : beg;
				end
				
				beg: begin
					{ld1_cnt, selx_3to1, selx_2to1, ld1_t, ld1_r, ldx_x2} = 6'b111111;
					ns = mult1;
				end
				
				mult1: begin
					{selx2, selt, ldx_t} = 3'b111;
					ns = mult2;
				end
				
				mult2: begin
					{selrom, selt, ldx_t} = 3'b111;
					ns = add;
				end
				
				add: begin
					{cen, ldx_r} = 2'b11;
					seladd = ~outeven;
					ns = co ? idle : (lt ? idle : mult1);
					done = (ns == idle);
				end
			endcase
		end
		
	always @(posedge clk, posedge rst) begin
		if (rst) ps <= idle;
		else ps <= ns;
	end
	
	always @(posedge clk, posedge rst) begin
		if(rst) addr <= 3'b000;
		else if(ld1_cnt)addr <= 3'b001;
		else if(cen) {co, addr} <= addr+1;
		else addr <= addr;
	end
	assign outeven = addr[0];
endmodule
