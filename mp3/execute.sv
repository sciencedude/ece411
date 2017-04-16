import lc3b_types::*;

module execute
(
	input clk,
	input ID_EX id_ex_out,
	input stall,
	input mem_resp_i,
	input [3:0] ex_mem_destreg, mem_wb_destreg,
	input lc3b_word ex_mem_data, mem_wb_data,
	output EX_MEM ex_mem_out,
	output lc3b_word exe_pc,
	output lc3b_word exe_data
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
logic [1:0] datafwd_sra_sel;
lc3b_word datafwd_sra_out;
logic [1:0] datafwd_srb_sel;
lc3b_word datafwd_srb_out;

mux4 datafwd_sra
(
	.sel(datafwd_sra_sel),
	.a(id_ex_out.srca_out),
	.b(mem_wb_data),
	.c(ex_mem_data),
	.d(),
	.f(datafwd_sra_out)
);

mux2 srcamux
(
	.sel(id_ex_out.control_signals.srcamux_sel),
	.a(datafwd_sra_out),
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

mux4 datafwd_srb
(
	.sel(datafwd_srb_sel),
	.a(id_ex_out.srcb_out),
	.b(mem_wb_data),
	.c(ex_mem_data),
	.d(),
	.f(datafwd_srb_out)
);

mux8 srcbmux
(
	.sel(id_ex_out.control_signals.srcbmux_sel),
	.a(datafwd_srb_out),
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
assign exe_pc = id_ex_out.pc_out;
assign exe_data = ex_mem_in.alu_out;
assign ex_mem_in.destreg = id_ex_out.destreg;
//assign ex_mem_in.address = ex_mem_in.alu_out;

always_comb
begin
datafwd_sra_sel = 2'b00;
datafwd_srb_sel = 2'b00;
	if((ex_mem_destreg == id_ex_out.sr1reg) && (ex_mem_destreg != 4'b1000))
		datafwd_sra_sel = 2'b10;
	else if((ex_mem_destreg == id_ex_out.sr2reg) && (ex_mem_destreg != 4'b1000))
		datafwd_srb_sel = 2'b10;
	else if(~((ex_mem_destreg == id_ex_out.sr1reg) && (ex_mem_destreg != 4'b1000)) && ((mem_wb_destreg == id_ex_out.sr1reg) && mem_wb_destreg != 4'b1000))
		datafwd_sra_sel = 2'b01;
	else if(~((ex_mem_destreg == id_ex_out.sr1reg) && (ex_mem_destreg != 4'b1000)) && ((mem_wb_destreg == id_ex_out.sr1reg) && mem_wb_destreg != 4'b1000))
		datafwd_srb_sel = 2'b01;
end

 register #(.width($bits(EX_MEM))) ex_mem
 (
	.clk,
	.in(ex_mem_in),
	.load(stall),
	.out(ex_mem_out)
 );

endmodule : execute