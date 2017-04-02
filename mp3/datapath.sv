import lc3b_types ::*;

module datapath
(
	input logic clk,
	input logic pmem_resp,
	input logic [127:0] pmem_rdata,
	output logic pmem_read,
	output logic pmem_write,
	output logic [127:0] pmem_wdata,
	output logic [15:0] pmem_address
);

lc3b_word instruction;
lc3b_word data;
lc3b_word address_i;
lc3b_word address_d;
logic mem_resp_i;
logic mem_resp_d;
logic mem_resp;
logic mem_write;
lc3b_word mem_wdata;
lc3b_word intr;
lc3b_word alu_out;
logic branch_enable, load_regfile;
lc3b_reg dest;
logic mem_read_d;
IF_ID if_id;
lc3b_word regfile_in;
ID_EX id_ex1;
EX_MEM ex_mem_out;
lc3b_word mem_rdata;
MEM_WB mem_wb_out;
MEM_WB mem_wb;
logic pmem_readi, pmem_readd, pmem_writei, pmem_writed;
logic [127:0] pmem_wdatai, pmem_wdatad;
lc3b_word pmem_addressi, pmem_addressd;
assign alu_out = mem_wb_out.alu_out;
logic I_D_out;
logic pmem_resp_i, pmem_resp_d;
logic stall;
logic found_i, found_d, found;
lc3b_mem_wmask wmask;
lc3b_word mem_address_i;
logic [127:0] pmem_rdata_d;
logic mem_read_i;
//intialize all the stages in pipeline
fetch F(.*, .address(address_i), .intr(instruction));
decode D(.*);
execute E(.*,.id_ex_out(id_ex1));
mem_stage M(.*, .ex_mem(ex_mem_out),.address(address_d), .mem_rdata(data));
wb_stage W(.*, .mem_wb(mem_wb_out));

cache I_cache
(
	.clk,
	.mem_address(mem_address_i),
	.mem_wdata,
	.mem_read(mem_read_i),
	.mem_write,
	.mem_byte_enable(2'b11),
	.pmem_resp(pmem_resp_i),
	.pmem_rdata,
	.mem_resp(mem_resp_i),
	.mem_rdata(instruction),
	.pmem_read(pmem_readi),
	.pmem_write(pmem_writei),
	.pmem_wdata(pmem_wdatai),
	.pmem_address(pmem_addressi),
	.found(found_i)
);


cache D_cache
(
	.clk,
	.mem_address(address_d),
	.mem_wdata,
	.mem_read(mem_read_d),
	.mem_write,
	.mem_byte_enable(wmask),
	.pmem_resp(pmem_resp_d | found),
	.pmem_rdata(pmem_rdata_d),
	.mem_resp(mem_resp_d),
	.mem_rdata(data),
	.pmem_read(pmem_readd),
	.pmem_write(pmem_writed),
	.pmem_wdata(pmem_wdatad),
	.pmem_address(pmem_addressd),
	.found(found_d)
);

mux2# (128) get_from_i
(
	.sel(found),
	.a(pmem_rdata),
	.b(pmem_wdatai),
	.f(pmem_rdata_d)
);

mux2#(1) hit
(
	.sel(~I_D_out),
	.a(found_i),
	.b(found_d),
	.f(found)
);

mux2 #(1) RESP
(
	.sel(I_D_out),
	.a(mem_resp_i),
	.b(mem_resp_d),
	.f(mem_resp)
);

mux2 #(16) address_mux
(
	.sel(I_D_out),
	.a(pmem_addressi),
	.b(pmem_addressd),
	.f(pmem_address)
);

mux2 #(16) address_i_mux
(
	.sel(I_D_out),
	.a(address_i),
	.b(pmem_addressd),
	.f(mem_address_i)
);

mux2 #(128) wdata_mux
(
	.sel(I_D_out),
	.a(pmem_wdatai),
	.b(pmem_wdatad),
	.f(pmem_wdata)
);

cache_arbiter CA
(
	.clk,
	.pmem_read_i(pmem_readi),
	.pmem_read_d(pmem_readd),
	.pmem_write_i(pmem_writei),
	.pmem_write_d(pmem_writed),
	.mem_resp,
	.pmem_resp,
	.pmem_resp_i,
	.pmem_resp_d,
	.pmem_read,
	.pmem_write,
	.I_D_out,
	.found(found)
);
endmodule