import lc3b_types::*;

module cache_datapath
(
	input clk,
	input lc3b_word mem_address,
	input logic mem_read,
	input logic mem_write,
	input lc3b_mem_wmask mem_byte_enable,
	output logic[127:0] pmem_wdata,
	input logic[127:0] pmem_rdata,
	output lc3b_word pmem_address,
	output logic hit,
	input lc3b_word mem_wdata,
	output lc3b_word mem_rdata,
	input logic dirty1_in,
	input logic dirty2_in,
	output logic dirty1_out,
	output logic dirty2_out,
	input logic dirty1_load,
	input logic dirty2_load,
	input logic vaild1_in,
	input logic vaild2_in,
	input logic vaild1_load,
	input logic vaild2_load,
	output logic vaild1_out,
	output logic vaild2_out,
	input logic set1_load,
	input logic set2_load,
	input logic tag1_load,
	input logic tag2_load,
	input logic pmem_address_sel,
	output logic lru_out,
	input logic lru_load,
	input logic setin_mux_sel,
	output logic hit_out
);

logic [127:0] set1_out;
logic [127:0] set2_out;
logic [127:0] set_mux_out;
logic [127:0] set1in_mux_out;
logic [127:0] set2in_mux_out;
logic [127:0] set1in_out;
logic [127:0] set2in_out;
logic [127:0] word1_out;
logic [127:0] word2_out;
lc3b_word writeback_out;
logic [8:0]tag1_out;
logic [8:0]tag2_out;
logic comp_tag1_out;
logic comp_tag2_out;


//logic [2:0] index;
//assign index = mem_address[5:3];

array #(.width(128))set1
(
	.clk,
	.address(mem_address[6:4]),
	.w_data(set1in_mux_out),
	.r_data(set1_out),
	.write(set1_load)
);

mux2 #(.width(128))set1in_mux
(
	.sel(setin_mux_sel),
	.a(pmem_rdata),
	.b(word1_out),
	.f(set1in_mux_out)
);

splicer word1
(
	.offset(mem_address[3:1]),
	.a(set1_out),
	.b(mem_wdata),
	.byte_enable(mem_byte_enable),
	.f(word1_out)
);

array #(.width(128))set2
(
	.clk,
	.address(mem_address[6:4]),
	.w_data(set2in_mux_out),
	.r_data(set2_out),
	.write(set2_load)
);

mux2 #(.width(128))set2in_mux
(
	.sel(setin_mux_sel),
	.a(pmem_rdata),
	.b(word2_out),
	.f(set2in_mux_out)
);

splicer word2
(
	.offset(mem_address[3:1]),
	.a(set2_out),
	.b(mem_wdata),
	.byte_enable(mem_byte_enable),
	.f(word2_out)
);

array #(.width(9))tag1
(
	.clk,
	.address(mem_address[6:4]),
	.w_data(mem_address[15:7]),
	.r_data(tag1_out),
	.write(tag1_load)
);

array  #(.width(9))tag2
(
	.clk,
	.address(mem_address[6:4]),
	.w_data(mem_address[15:7]),
	.r_data(tag2_out),
	.write(tag2_load)	
);

array  #(.width(1))vaild1
(
	.clk,
	.address(mem_address[6:4]),
	.w_data(vaild1_in),
	.r_data(vaild1_out),
	.write(vaild1_load)
);

array  #(.width(1))vaild2
(
	.clk,
	.address(mem_address[6:4]),
	.w_data(vaild2_in),
	.r_data(vaild2_out),
	.write(vaild2_load)	
);

array  #(.width(1))dirty1
(
	.clk,
	.address(mem_address[6:4]),
	.w_data(dirty1_in),
	.r_data(dirty1_out),
	.write(dirty1_load)
);

array  #(.width(1))dirty2
(
	.clk,
	.address(mem_address[6:4]),
	.w_data(dirty2_in),
	.r_data(dirty2_out),
	.write(dirty2_load)
);

array  #(.width(1))lru
(
	.clk,
	.address(mem_address[6:4]),
	.write(lru_load),
	.w_data(~hit_out),
	.r_data(lru_out)
);

mux2 #(.width(128))set_mux
(
	.sel(hit_out),
	.a(set1_out),
	.b(set2_out),
	.f(set_mux_out)
);

decodes offset_decode
(
	.offset(mem_address[3:1]),
	.a(set_mux_out),
	.f(mem_rdata)
);

comparator comp_tag1
(
	.a(tag1_out),
	.b(mem_address[15:7]),
	.f(comp_tag1_out)
);
comparator comp_tag2
(
	.a(tag2_out),
	.b(mem_address[15:7]),
	.f(comp_tag2_out)
);

hit hitdet
(
	.a(comp_tag1_out&vaild1_out),
	.b(comp_tag2_out&vaild2_out),
	.f(hit_out),
	.hit
);


mux2#(.width(128)) pmem_wdata_mux
(
	.sel(lru_out),
	.a(set1_out),
	.b(set2_out),
	.f(pmem_wdata)
);

mux2 writeback_mux
(
	.sel(lru_out),
	.a({tag1_out,mem_address[6:4],4'b0000}),
	.b({tag2_out,mem_address[6:4],4'b0000}),
	.f(writeback_out)
);

mux2 pmem_address_mux
(
	.sel(pmem_address_sel),
	.a(writeback_out),	
	.b({mem_address[15:4],4'b0000}),
	.f(pmem_address)
);

endmodule : cache_datapath