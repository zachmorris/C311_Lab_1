module bintohex_encoder( binary_in, hex_out);
	input [3:0] binary_in;
	output [3:0] hex_out;
	
	always_comb
		case(binary_in)
			4'b0000: hex_out = 4'h0;
			4'b0001: hex_out = 4'h1;
			4'b0010: hex_out = 4'h2;
			4'b0011: hex_out = 4'h3;
			4'b0100: hex_out = 4'h4;
			4'b0101: hex_out = 4'h5;
			4'b0110: hex_out = 4'h6;
			4'b0111: hex_out = 4'h7;
			4'b1000: hex_out = 4'h8;
			4'b1001: hex_out = 4'h9;
			4'b1010: hex_out = 4'hA;
			4'b1011: hex_out = 4'hB;
			4'b1100: hex_out = 4'hC;
			4'b1101: hex_out = 4'hD;
			4'b1110: hex_out = 4'hE;
			4'b1111: hex_out = 4'hF;
			default: hex_out = 4'h0;
		endcase 
endmodule
			
		
	