module ping_pong_array (inclk, reset, array_out);
	parameter width = 8;
	input inclk, reset;
	output [width-1:0] array_out;
	
	logic shift_val;
	logic next_shift;
	
	// assign values to right and left
	parameter	right = 1;
	parameter	left 	= 0;
	
always_ff@(posedge inclk, posedge reset)
	begin
	
	if(reset)
		begin
			shift_val <= left;							//initialize shift to leftward
			array_out <= {{width-2{1'b0}}, 1'b1};	//initialize array
		end
	else if(shift_val == left)
			array_out <= array_out << 1;
	else
			array_out <= array_out >> 1;

	shift_val <= next_shift;
	
	end
		
always_comb	
		if(array_out[0])
			next_shift = left;
		else if(array_out[width-1])
			next_shift = right;
		else
			next_shift = shift_val;

endmodule 

