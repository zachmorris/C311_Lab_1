module test_clk_divider(inclk,outclk,outclk_Not,div_clk_count,Reset, count_check);
	input inclk;
	input Reset;
	output outclk;
	output outclk_Not;
	input[31:0] div_clk_count;
		
	logic [31:0] count;  				// count up to div_clk_count
	output [31:0] count_check;
	
	always_ff @(posedge inclk, negedge Reset)
	begin	 
		count_check <= count % div_clk_count;
		if (Reset == 1'b0) 
			begin  
				outclk <= 0;  		// default value for outclk
				outclk_Not <= 1;	// default value for outclk_Not
				count <= 0;			// default value for count
			end
		else if ((count % div_clk_count) == 32'h0000_0000) 
			// integer multiple of div_clk; update outclk
			begin
				outclk 		<= ~outclk;
				outclk_Not 	<= ~ outclk_Not;
				count  		<= 1;	
			end
		else
			// increase count until multiple of div_clk
			count <= count + 1;
	end

endmodule