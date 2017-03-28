module copy
(
	input logic [15:0] in,
	output logic [127:0] out
);

	assign out = {in,in,in,in,in,in,in,in};

endmodule