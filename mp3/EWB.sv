import lc3b_types::*;

module EWB
(
	input clk,
	input l2_write,
	input l2_read,
	input lc3b_word l2_address,
	input [127:0] l2_data, physical_rdata,
	input pmem_resp,
	output [127:0] pmem_wdata,
	output [127:0] l2_rdata,
	output logic pmem_write, physical_read, l2_resp,
	output lc3b_word ewb_address
);

logic rdatamux_sel, load_ewb;

EWB_datapath EWB_DP
(
	.*
);

EWB_control EWB_C
(
	.*
);

endmodule : EWB