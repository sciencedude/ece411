import lc3b_types::*;

module fetch
(
	input lc3b_word intr,
	input logic clk,
	output lc3b_word address,
	output IF_ID if_id
);


lc3b_word add_out;

plus2 add
(
	.in(if_id.pc_out),
	.out(add_out)
);

register #(.width(16)) pc
(
	.clk,
	.load(1'b1),
	.in(add_out),
	.out(if_id.pc_out)
);

assign if_id.intr = intr;
assign address = if_id.pc_out;

endmodule
	