import lc3b_types::*;

module wb_stage
(
	input clk, 	
	input MEM_WB mem_wb,
	output logic branch_enable,
	output lc3b_reg dest,
	output logic load_regfile,
	output lc3b_word regfile_in
);

lc3b_nzp gencc_out;
lc3b_nzp cc_out;

mux4 cc_mux
(
	.sel(mem_wb.control_signals.cc_mux_sel),
	.a(mem_wb.alu_out),
	.b(mem_wb.mem_data),
	.c(mem_wb.pc_out),
	.d(16'h0),
	.f(regfile_in)
);

gencc gencc1
(
	.in(regfile_in),
	.out(gencc_out)
);

register #(.width(3)) cc
(
	.clk,
	.load(mem_wb.control_signals.load_cc),
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


assign load_regfile = mem_wb.control_signals.load_regfile;
assign dest = mem_wb.intr[11:9];

endmodule : wb_stage