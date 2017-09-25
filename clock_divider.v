module clock_divider(inclk,outclk,outclk_Not,div_clk_count,Reset);
input inclk;
input Reset;
output outclk;
output outclk_Not;
input[31:0] div_clk_count;
	 
always_ff @(posedge inclk)
	begin		
		outclk <= ~outclk;
		outclk_Not <= outclk_Not;
	end

endmodule