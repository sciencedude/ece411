module IO 
(
	input logic [15:0]hits_i,
	input logic [15:0]hits_d,
	input logic [15:0]hits_l2,
							miss_i,
							miss_d,
							miss_l2,
	input logic [15:0] address_d,
	output logic read_mux2_sel,
	output logic [15:0] out
);

logic [2:0] IO_mux_sel;

mux8 #(16) IO_mux
(
	.sel(IO_mux_sel),
	.a(16'h0),
	.b(hits_i),
	.c(hits_d),
	.d(hits_l2),
	.e(miss_i),
	.f(miss_d),
	.g(miss_l2),
	.h(16'h0),
	.out(out)
);


always_comb
begin
	read_mux2_sel = 1'b0;
	if(address_d >= 16'hFFF0)	begin
	IO_mux_sel = address_d[15:1] - 15'h7FF8;
	read_mux2_sel = 1'b1;
	end
	else
	IO_mux_sel = 3'h0;
end

endmodule
