import lc3b_types::*;

module EWB_datapath
(
	input clk,
	input load_ewb,
	input lc3b_word l2_address,
	input [127:0] l2_data,
	output lc3b_word ewb_address,
	output [127:0] pmem_wdata
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

endmodule : EWB_datapath