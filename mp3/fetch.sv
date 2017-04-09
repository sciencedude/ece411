import lc3b_types::*;

module fetch
(
	input lc3b_word intr,
	input logic clk,
	input lc3b_word alu_out,
	input mem_resp_i,
	input stage_sel,
	input stall,
	input branch_enable,
	input [1:0] pcmux_sel,
	input lc3b_word mem_wdata,
	output lc3b_word address,
	output logic mem_read_i,
	output IF_ID if_id
);


lc3b_word add_out;
lc3b_word pc_in;
lc3b_word pc_out;
lc3b_word branchmux_out;
plus2 add
(
	.in(pc_out), //program would branch only for one intr the countie like it didn't branch changed to pc_out scp
	.out(add_out)
);

mux2 branchmux
(
	.sel(branch_enable),
	.a(add_out),
	.b(alu_out),
	.f(branchmux_out)
);

mux4 pc_mux
(
	.sel(pcmux_sel),
	.a(branchmux_out),
	.b(alu_out),
	.c(mem_wdata),
	.d(),
	.f(pc_in)
);

register #(.width(16)) pc
(
	.clk,
	.load(stall | stage_sel),
	.in(pc_in),
	.out(pc_out)
);

register #($bits(IF_ID)) IF_ID_OUT
(
	.clk,
	.load(stall),
	.in({intr,pc_in}),
	.out(if_id)
);

assign mem_read_i = stall;
//assign if_id.intr = intr;
assign address = pc_out;

endmodule
	