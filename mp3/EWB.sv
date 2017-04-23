import lc3b_types::*;

module EWB
(
	input clk,
	input load_ewb,
	input l2_evict,
	input l2_write,
	input l2_read,
	input lc3b_word l2_address,
	input [127:0] l2_data,
	input pmem_resp,
	output logic isEmpty,
	output logic isReady,
	output [127:0] pmem_wdata,
	output logic pmem_write,
	output lc3b_word ewb_address
);

EWB_datapath EWB_DP
(
	.*
);

EWB_control EWB_C
(
	.*
);

endmodule : EWB