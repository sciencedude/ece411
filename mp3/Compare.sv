module Compare #(parameter width = 9) 
(
	input logic [width-1:0] a, b, // added this so we can compare thing of diffrent bit sizes
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
