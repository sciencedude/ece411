import lc3b_types::*;

module EWB_datapath
(
	input clk,
	input load_ewb, rdatamux_sel,
	input lc3b_word l2_address,
	input [127:0] l2_data, physical_rdata,
	output lc3b_word ewb_address,
	output [127:0] pmem_wdata, l2_rdata
);

register #(.width(16)) ewb_address1
(
	.clk,
	.load(load_ewb),
	.in(l2_address),
	.out(ewb_address)
);

register #(.width(128)) ewb_data
(
	.clk,
	.load(load_ewb),
	.in(l2_data),
	.out(pmem_wdata)
);

mux2 #(.width(128)) rdata
(
	.sel(rdatamux_sel),
	.a(physical_rdata),
	.b(pmem_wdata),
	.f(l2_rdata)
);

endmodule : EWB_datapath