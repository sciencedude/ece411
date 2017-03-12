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
lc3b_word pc_out;
plus2 add
(
	.in(if_id.pc_out),
	.out(add_out)
);

mux2 pc_mux
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
	.out(pc_out)
);

register #($bits(IF_ID)) IF_ID_OUT
(
	.clk,
	.load(1'b1),
	.in({intr,pc_out}),
	.out(if_id)
);


//assign if_id.intr = intr;
assign address = pc_out;

endmodule
	