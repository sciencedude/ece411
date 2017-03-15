import lc3b_types::*;

module mem_stage
(
	input clk,
	input EX_MEM ex_mem,
	input lc3b_word mem_rdata,
	output MEM_WB mem_wb_out,
	output lc3b_word mem_wdata, address
);

MEM_WB mem_wb_in;

mux2 mar_mux
(
	.sel(ex_mem.control_signals.marmux_sel),
	.a(ex_mem.alu_out),
	.b(ex_mem.srcb_out),
	.f(address)
);

mux2 mdr_mux
(
	.sel(ex_mem.control_signals.mdr_mux_sel),
	.a(ex_mem.alu_out),
	.b(mem_rdata),
	.f(mem_wdata)
);

//assign mem_wb.address = ex_mem.address;
assign mem_wb_in.mem_data = mem_wdata;
assign mem_wb_in.pc_out = ex_mem.pc_out;
assign mem_wb_in.alu_out = ex_mem.alu_out;
assign mem_wb_in.intr = ex_mem.intr;
assign mem_wb_in.control_signals = ex_mem.control_signals;

register #(.width($bits(MEM_WB))) mem_wb
 (
	.clk,
	.in(mem_wb_in),
	.out(mem_wb_out),
	.load(1'b1)
 );

endmodule : mem_stage