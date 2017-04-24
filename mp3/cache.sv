module cache
(
	input logic clk,
	input logic [15:0] mem_address,
	input logic [15:0] mem_wdata,
	input logic mem_read,
	input logic mem_write,
	input logic [1:0] mem_byte_enable,
	input logic pmem_resp,
	input logic [127:0] pmem_rdata,
	input logic reset_hits, reset_miss,
	
	
	
	output logic mem_resp,
	output logic [15:0] mem_rdata,
	output logic pmem_read,
	output logic pmem_write,
	output logic [127:0] pmem_wdata,
	output logic [15:0] pmem_address,
	output logic [15:0] actual_hits, miss,
	output logic found
);

logic LRU_write,tag_write,valid_write,data_write,datamux_sel,MSBmux_sel,LSBmux_sel,dirty_write_val,dirty_write,dirty, cout_1, cout_2, addrmux_sel, write_mux_sel;
logic [8:0] tag;
logic [2:0] set;
logic [2:0] offset;

cache_datapath CD(.*);
cache_control CC(.*);

endmodule