module L2
(
	input logic clk,
					pmem_read, pmem_write,
					physical_resp,
	input logic [127:0] physical_rdata,
							  pmem_wdata,
	input logic [15:0] pmem_address,
							  
	output logic physical_read, physical_write,
					 pmem_resp,
	
	output logic [127:0] physical_wdata
);

logic dirty_write_val, wdatamux_sel,
					data_write0, data_write1, data_write2, data_write3,
					tag_write0, tag_write1, tag_write2, tag_write3,
					valid_write0, valid_write1, valid_write2, valid_write3,
					dirty_write0, dirty_write1, dirty_write2, dirty_write3,
					LRU_write0, LRU_write1, LRU_write2, LRU_write3;
logic valid_out0, valid_out1, valid_out2, valid_out3,
	dirty_out0, dirty_out1, dirty_out2, dirty_out3,
	hit0, hit1, hit2, hit3, hit;
logic [1:0] LRU_out0, LRU_out1, LRU_out2, LRU_out3;

L2_datapath L2_d (.*, .address(pmem_address));
L2_control L2_c (.*);

endmodule