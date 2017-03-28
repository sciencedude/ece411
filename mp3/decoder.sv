module decoder
(
	input logic [2:0] in,
	output logic [7:0] out
);

	always_comb
	begin
	out = 8'h0;
		case(in)
			3'h0: out[0] = 1'b1;
			3'h1: out[1] = 1'b1;
			3'h2: out[2] = 1'b1;
			3'h3: out[3] = 1'b1;
			3'h4: out[4] = 1'b1;
			3'h5: out[5] = 1'b1;
			3'h6: out[6] = 1'b1;
			3'h7: out[7] = 1'b1;
		endcase
	end
	
endmodule