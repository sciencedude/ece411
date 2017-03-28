import lc3b_types::*;

module mem_stage
(
	input clk,
	input EX_MEM ex_mem,
	input lc3b_word mem_rdata,
	input mem_resp_d,
	output MEM_WB mem_wb_out,
	output mem_write,
	output mem_read_d,
	output logic stall,
	output lc3b_word mem_wdata, address
);

MEM_WB mem_wb_in;

mux2 mar_mux
(
	.sel(ex_mem.control_signals.marmux_sel),
	.a(ex_mem.alu_out),
	.b(ex_mem.srcb_out), //i have no idea why this is here scp
	.f(address)
);

mux4 mdr_mux
(
	.sel(ex_mem.control_signals.mdr_mux_sel),
	.a(ex_mem.alu_out),
	.b(mem_rdata),
	.c(ex_mem.srcb_out), //added this because was in paper design scp
	.d(16'h0),
	.f(mem_wdata)
);

//assign mem_wb.address = ex_mem.address;
assign mem_wb_in.mem_data = mem_wdata;
assign mem_wb_in.pc_out = ex_mem.pc_out;
assign mem_wb_in.alu_out = ex_mem.alu_out;
assign mem_wb_in.intr = ex_mem.intr;
assign mem_wb_in.control_signals = ex_mem.control_signals;
assign mem_write = ex_mem.control_signals.mem_write;
assign mem_read_d = ex_mem.control_signals.mem_read_d;

//stall = 1 means don't stall
always_comb
begin
	if(mem_read_d)
	stall = mem_resp_d;
	else
	stall = 1'b1;
end

register #(.width($bits(MEM_WB))) mem_wb
 (
	.clk,
	.in(mem_wb_in),
	.out(mem_wb_out),
	.load(mem_resp_d)
 );

endmodule : mem_stage