module IO 
(
	input logic [15:0]hits_i,
	input logic [15:0]hits_d,
	input logic [15:0]hits_l2,
							miss_i,
							miss_d,
							miss_l2,
	input logic [15:0] address_d,
	input logic mem_write,
	output logic read_mux2_sel,
	output logic reset_l2miss, reset_l2hits,
					 reset_imiss, reset_ihits,
					 reset_dmiss, reset_dhits,
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
	IO_mux_sel = address_d[15:1] - 15'h7FF7;
	read_mux2_sel = 1'b1;
	end
	else
	IO_mux_sel = 3'h0;
end

always_comb
begin
	reset_l2miss = 1'b0;
	reset_l2hits = 1'b0;
	reset_dhits = 1'b0;
	reset_dmiss = 1'b0;
	reset_ihits = 1'b0;
	reset_imiss = 1'b0;
	
	if((IO_mux_sel == 6) & mem_write)
	reset_l2miss = 1'b1;
	if((IO_mux_sel == 3) & mem_write)
	reset_l2hits = 1'b1;
	if((IO_mux_sel == 1) & mem_write)
	reset_ihits = 1'b1;
	if((IO_mux_sel == 2) & mem_write)
	reset_dhits = 1'b1;
	if((IO_mux_sel == 4) & mem_write)
	reset_imiss = 1'b1;
	if((IO_mux_sel == 5) & mem_write)
	reset_dmiss = 1'b1;
	
end
	

endmodule
