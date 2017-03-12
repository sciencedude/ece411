import lc3b_types::*;

module fetch
(
	input lc3b_word intr,
	input logic clk,
	input lc3b_word alu_out,
	input branch_enable,
	output lc3b_word address,
	output IF_ID if_id
);


lc3b_word add_out;
lc3b_word pc_in;
plus2 add
(
	.in(if_id.pc_out),
	.out(add_out)
);

mux2
(
	.sel(branch_enable),
	.a(add_out),
	.b(alu_out),
	.f(pc_in)
);

register #(.width(16)) pc
(
	.clk,
	.load(1'b1),
	.in(pc_in),
	.out(if_id.pc_out)
);

assign if_id.intr = intr;
assign address = if_id.pc_out;

endmodule
	