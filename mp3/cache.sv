import lc3b_types::*;

module cache
(
	input clk,
	input mem_read,
	input mem_write,
	output lc3b_word mem_rdata,
	input lc3b_word mem_wdata,
	output mem_resp,
	output pmem_read,
	output pmem_write,
	input	pmem_resp,
	input lc3b_mem_wmask mem_byte_enable,
	output logic[127:0] pmem_wdata,
	input logic[127:0] pmem_rdata,
	input lc3b_word mem_address,
	output lc3b_word pmem_address

);
	logic dirty1_in;
	logic dirty2_in;
	logic dirty1_out;
	logic dirty2_out;
	logic dirty1_load;
	logic dirty2_load;
	logic vaild1_in;
	logic vaild2_in;
	logic vaild1_load;
	logic vaild2_load;
	logic vaild1_out;
	logic vaild2_out;
	logic set1_load;
	logic set2_load;
	logic tag1_load;
	logic tag2_load;
	logic pmem_address_sel;
	logic hit;
	logic hit_out;
	logic lru_out;
	logic lru_load;
	logic setin_mux_sel;

cache_control cah_controler
(
	.clk,
	.mem_read,
	.mem_write,
	.mem_resp,
	.pmem_read,
	.pmem_write,
	.pmem_resp,
	.hit,
	.dirty1_out,
	.dirty2_out,
	.vaild1_out,
	.vaild2_out,
	.set1_load,
	.set2_load,
	.tag1_load,
	.tag2_load,
	.dirty1_in,
	.dirty2_in,
	.dirty1_load,
	.dirty2_load,
	.vaild1_in,
	.vaild2_in,
	.vaild1_load,
	.vaild2_load,	
	.lru_out,
	.lru_load,
	.pmem_address_sel,
	.setin_mux_sel,
	.hit_out
);

cache_datapath cah_dut
(
	.clk,
	.mem_address,
	.mem_read,
	.mem_write,
	.mem_byte_enable,
	.pmem_wdata,
	.pmem_rdata,
	.pmem_address,
	.hit,
	.hit_out,
	.mem_wdata,
	.mem_rdata,
	.dirty1_in,
	.dirty2_in,
	.dirty1_out,
	.dirty2_out,
	.dirty1_load,
	.dirty2_load,
	.vaild1_in,
	.vaild2_in,
	.vaild1_load,
	.vaild2_load,
	.vaild1_out,
	.vaild2_out,
	.set1_load,
	.set2_load,
	.tag1_load,
	.tag2_load,
	.pmem_address_sel,
	.lru_out,
	.lru_load,
	.setin_mux_sel
);

endmodule : cache