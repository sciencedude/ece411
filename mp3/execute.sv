import lc3b_types::*;

module execute
(
	input clk,
	input ID_EX id_ex_out,
	input stall,
	input mem_resp_i,
	output EX_MEM ex_mem_out
);

EX_MEM ex_mem_in;
lc3b_word srcamux_out;
lc3b_word srcbmux_out;
lc3b_word imm4_out;
lc3b_word imm5_out;
lc3b_word adj6_out;
lc3b_word adj9_out;
lc3b_word sext_6;
lc3b_word adj11_out;
mux2 srcamux
(
	.sel(id_ex_out.control_signals.srcamux_sel),
	.a(id_ex_out.srca_out),
	.b(id_ex_out.pc_out),
	.f(srcamux_out)
);

zext #(.width(4)) imm4
(
	.in(id_ex_out.intr[3:0]),
	.out(imm4_out)
);

sext#(.width(5)) imm5
(
	.in(id_ex_out.intr[4:0]),
	.out(imm5_out)
);

adj #(.width(9)) adj9
(
	.in(id_ex_out.intr[8:0]),
	.out(adj9_out)
);

adj #(.width(6)) adj6
(
	.in(id_ex_out.intr[5:0]),
	.out(adj6_out)
);

sext#(.width(6)) sext6 //for stb and ldb they use change this with right mux entery later it should be SEXT(offset6)] with no left shift
(
	.in(id_ex_out.intr[5:0]),
	.out(sext_6)
);

adj #(.width(11)) adj11
(
	.in(id_ex_out.intr[10:0]),
	.out(adj11_out)
);

mux8 srcbmux
(
	.sel(id_ex_out.control_signals.srcbmux_sel),
	.a(id_ex_out.srcb_out),
	.b(imm5_out),
	.c(adj6_out),
	.d(adj9_out),
	.e(sext_6),
	.f(imm4_out),
	.g(adj11_out),
	.h(),
	.out(srcbmux_out)
);

alu ALU
(
	.aluop(id_ex_out.control_signals.aluop),
	.a(srcamux_out),
	.b(srcbmux_out),
	.f(ex_mem_in.alu_out)
);

assign ex_mem_in.intr = id_ex_out.intr;
assign ex_mem_in.pc_out = id_ex_out.pc_out;
assign ex_mem_in.srcb_out = id_ex_out.srcb_out;
assign ex_mem_in.control_signals = id_ex_out.control_signals;
//assign ex_mem_in.address = ex_mem_in.alu_out;

 register #(.width($bits(EX_MEM))) ex_mem
 (
	.clk,
	.in(ex_mem_in),
	.load(stall),
	.out(ex_mem_out)
 );

endmodule : execute