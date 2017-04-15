import lc3b_types::*;

module wb_stage
(
	input clk, 	
	input MEM_WB mem_wb,
	output logic branch_enable,
	output lc3b_reg dest,
	output logic load_regfile,
	output lc3b_word regfile_in,
	output logic[1:0] pcmux_sel,
	output logic destmux_sel,
	output lc3b_word new_pc,
	output lc3b_word wb_pc,
	output lc3b_word wb_data
	
);

lc3b_nzp gencc_out;
lc3b_nzp cc_out;
logic isbr;
logic branch_enable_out;
assign new_pc = mem_wb.mem_data;

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

always_comb
begin
	if(mem_wb.intr[15:12] == op_br)
	isbr = 1'b1;
	else
	isbr = 1'b0;
end

cccomp cccomp1
(
	.N(mem_wb.intr[11]),
	.Z(mem_wb.intr[10]),
	.P(mem_wb.intr[9]),
	.n(cc_out[2]),
	.z(cc_out[1]),
	.p(cc_out[0]),
	.out(branch_enable_out) //this is temp fix other branch still happen even tho not a branch intr
);


assign load_regfile = mem_wb.control_signals.load_regfile;
assign dest = mem_wb.intr[11:9];
assign branch_enable = branch_enable_out&isbr; //part of temp fix find better soultion scp
assign pcmux_sel = mem_wb.control_signals.pcmux_sel;
assign destmux_sel = mem_wb.control_signals.destmux_sel;
assign wb_pc = mem_wb.pc_out;
assign wb_data = mem_wb.alu_out;
endmodule : wb_stage