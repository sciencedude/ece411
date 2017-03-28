module Compare
(
	input logic [8:0] a, b,
	output logic result
);

	always_comb
	begin
		if(a == b)
		result = 1;
		else
		result = 0;
	end
	
endmodule
