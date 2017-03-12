import lc3b_types::*;

module execute
(
	input clk,
	input ID_EX id_ex_out,
	output EX_MEM ex_mem_out
);

EX_MEM ex_mem_in;
lc3b_word srcamux_out;
lc3b_word srcbmux_out;
lc3b_word imm5_out;
lc3b_word adj6_out;
lc3b_word adj9_out;
mux2 srcamux
(
	.sel(id_ex_out.control_signals.srcamux_sel),
	.a(id_ex_out.srca_out),
	.b(id_ex_out.pc_out),
	.f(srcamux_out)
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


mux4 srcbmux
(
	.sel(id_ex_out.control_signals.srcbmux_sel),
	.a(id_ex_out.srcb_out),
	.b(imm5_out),
	.c(adj6_out),
	.d(adj9_out),
	.f(srcbmux_out)
);

alu ALU
(
	.aluop(id_ex_out.control_signals.aluop),
	.a(srcamux_out),
	.b(srcbmux_out),
	.f(ex_mem_in.alu_out)
);

 register #(.width($bits(EX_MEM))) ex_mem
 (
	.clk,
	.in(ex_mem_in),
	.out(ex_mem_out)
 );

endmodule : execute