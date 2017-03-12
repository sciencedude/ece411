import lc3b_types::*;

module mem_stage
(
	input EX_MEM ex_mem,
	input lc3b_word mem_rdata,
	input mdr_mux_sel,
	input marmux_sel,
	output MEM_WB mem_wb,
	output lc3b_word mem_wdata, address
);


mux2 mar_mux
(
	.sel(marmux_sel),
	.a(ex_mem.alu_out),
	.b(ex_mem.srcb_out),
	.f(address)
);

mux2 mdr_mux
(
	.sel(mdr_mux_sel),
	.a(ex_mem.alu_out),
	.b(mem_rdata),
	.f(mem_wdata)
);

assign mem_address = ex_mem.alu_out;
//assign mem_wb.address = ex_mem.address;
assign mem_wb.mem_data = mem_wdata;
assign mem_wb.pc_out = ex_mem.pc_out;
assign mem_wb.alu_out = ex_mem.alu_out;
assign mem_wb.intr = ex_mem.intr;

endmodule : mem_stage