import lc3b_types::*;

module wb_stage
(
	input clk,
	input load_cc, 	
	input MEM_WB mem_wb,
	input [1:0] cc_mux_sel,
	output logic branch_enable,
	output lc3b_word regfile_in
);

lc3b_nzp gencc_out;

mux4 cc_mux
(
	sel(cc_mux_sel),
	a(mem_wb.address),
	b(mem_wb.mem_data),
	c(mem_wb.pc_out),
	d(mem_wb.alu_out),
	f(regfile_in)
);

gencc gencc1
(
	in(regfile_in),
	out(gencc_out)
);

register #(.width(3)) cc
(
	.clk,
	.load(load_cc),
	.in(gencc_out),
	.out(cc_out)
);

cccomp cccomp1
(
	.N(mem_wb.intr[11]),
	.Z(mem_wb.intr[10]),
	.P(mem_wb.intr[9]),
	.n(cc_out[2]),
	.z(cc_out[1]),
	.p(cc_out[0]),
	.out(branch_enable)
);

endmodule : wb_stage