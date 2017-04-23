import lc3b_types ::*;

module datapath
(
	input logic clk,
	input logic physical_resp,
	input logic [127:0] physical_rdata,
	output logic physical_read,
	output logic physical_write,
	output logic [127:0] physical_wdata,
	output logic [15:0] physical_address
);
logic [15:0] pmem_address;
logic pmem_resp;
logic [127:0] pmem_rdata;
logic pmem_read;
logic pmem_read_in;
logic pmem_write;
logic [127:0] pmem_wdata;
lc3b_word instruction;
lc3b_word data;
lc3b_word address_i;
lc3b_word address_d;
logic mem_resp_i;
logic mem_resp_d;
logic mem_resp;
logic mem_write;
lc3b_word mem_wdata;
//lc3b_word intr;
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
logic [1:0] pcmux_sel;
logic state;
logic isI;
logic mem_intr;
logic got_intr_out;
logic got_data_out;
logic got_intr_load;
logic got_data_load;
logic got_intr_in;
logic got_data_in;
logic readmux_out;
logic writemux_out;
logic destmux_sel;
logic stage_sel;
logic [1:0] pcmuxsel;
lc3b_word new_pc;
lc3b_word mem_pc;
lc3b_word exe_pc;
lc3b_word wb_pc;
lc3b_word srcain_pc;
lc3b_word srcbin_pc;
lc3b_word exe_data;
lc3b_word mem_data;
lc3b_word wb_data;
lc3b_word pmem_address_in;
logic [3:0] mem_wb_destreg;
logic [3:0] ex_mem_destreg;
lc3b_word ex_mem_data;	
logic load_reg;
logic flush;
IF_ID nop_if_id;
ID_EX nop_id_ex;
EX_MEM nop_ex_mem;
IF_ID if_id_mux;
ID_EX id_ex_mux;
EX_MEM ex_mem_mux;
lc3b_word fetchflush_out;
CONTROL nop_control;
logic ewb_write;
logic [127:0] ewb_data;
lc3b_word ewb_address_out, ewb_address, l2_address1;
logic isEmpty, isReady, load_ewb, l2_evict;
logic pmem_write_in;

assign pmem_rdata = ewb_data;

//intialize all the stages in pipeline
fetch F(.*, .mem_wdata(new_pc), .address(address_i), .intr(fetchflush_out));
decode D(.*,.if_id(if_id_mux));
execute E(.*,.id_ex_out(id_ex_mux), .mem_wb_data(regfile_in));
mem_stage M(.*,.mem_intr ,.ex_mem(ex_mem_mux),.address(address_d), .mem_rdata(data));
wb_stage W(.*, .mem_wb(mem_wb_out));

stall_logic sl
(
	.mem_resp_i,
	.mem_resp_d,
	.got_intr_out,
	.got_data_out,
	.stall,
	.state,
	.isI,
	.mem_intr,
	.got_intr_load,
	.got_data_load,
	.got_intr_in,
	.got_data_in
);

assign nop_control.srcamux_sel = 1'b0;
assign nop_control.srcbmux_sel = 3'b000;
assign nop_control.aluop = alu_add;
assign nop_control.marmux_sel = 2'b00;	//change it to zero
assign nop_control.mdr_mux_sel = 3'b000; //change it to zero
assign nop_control.cc_mux_sel = 1'b0;
assign nop_control.load_regfile = 1'b0; //change it to zero
assign nop_control.load_cc = 1'b0;
assign nop_control.mem_write = 1'b0;
assign nop_control.mem_read_d = 1'b0;
assign nop_control.isI = 1'b0;
assign nop_control.mem_intr = 1'b0;
assign nop_control.pcmux_sel = 2'b00;
assign nop_control.destmux_sel = 1'b0;

assign nop_id_ex.control_signals = nop_control;
assign nop_ex_mem.control_signals = nop_control;

assign nop_if_id.intr = 16'h0000;
assign nop_id_ex.intr = 16'h0000;
assign nop_ex_mem.intr = 16'h0000;

assign nop_id_ex.destreg = 4'b1000;
assign nop_id_ex.sr1reg = 4'b1000;
assign nop_id_ex.sr2reg = 4'b1000;

mux2 #(16)fetchflush
(
	.sel(flush),
	.a(instruction),
	.b(16'h0000),
	.f(fetchflush_out)
);

mux2#($bits(IF_ID)) decodeflush
(
	.sel(flush),
	.a(if_id),
	.b(nop_if_id),
	.f(if_id_mux)
);

mux2#($bits(ID_EX)) excuteflush
(
	.sel(flush),
	.a(id_ex1),
	.b(nop_id_ex),
	.f(id_ex_mux)
);

mux2#($bits(EX_MEM)) memflush
(
	.sel(flush),
	.a(ex_mem_out),
	.b(nop_ex_mem),
	.f(ex_mem_mux)
);

register #(1) got_intr
(
	.clk,
	.in(got_intr_in),
	.load(got_intr_load),
	.out(got_intr_out)
);

register #(1) got_data
(
	.clk,
	.in(got_data_in),
	.load(got_data_load),
	.out(got_data_out)
);

mux2 #(1) readmux
(
	.sel(got_data_out),
	.a(mem_read_d),
	.b(1'b0),
	.f(readmux_out)
);

mux2 #(1) writemux
(
	.sel(got_data_out),
	.a(mem_write),
	.b(1'b0),
	.f(writemux_out)
);



cache I_cache
(
	.clk,
	.mem_address(address_i),//mem_address_i),
	.mem_wdata,
	.mem_read(1'b1&~got_intr_out),//mem_read_i),
	.mem_write(1'b0),
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
	.mem_read(readmux_out),
	.mem_write(writemux_out),
	.mem_byte_enable(wmask),
	.pmem_resp(pmem_resp_d),// | found),
	.pmem_rdata,//(pmem_rdata_d),
	.mem_resp(mem_resp_d),
	.mem_rdata(data),
	.pmem_read(pmem_readd),
	.pmem_write(pmem_writed),
	.pmem_wdata(pmem_wdatad),
	.pmem_address(pmem_addressd),
	.found(found_d)
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
	.f(pmem_address_in)
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
	.pmem_read(pmem_read_in),
	.pmem_write(pmem_write_in),
	.I_D_out,
	.load_reg,
	.found(found)
);

mux2 #(.width(16)) ewbmux
(
	.sel(physical_write),
	.a(l2_address1),
	.b(ewb_address),
	.f(physical_address)
);

register #(16) address_reg
(
	.clk,
	.load(load_reg),
	.in(pmem_address_in),
	.out(pmem_address)
);

register #(1) pmem_readreg
(
	.clk,
	.load(1'b1),
	.in(pmem_read_in),
	.out(pmem_read)
);

register #(1) pmem_writereg
(
	.clk,
	.load(1'b1),
	.in(pmem_write_in),
	.out(pmem_write)
);

L2 L2_cache
(
	.*,
	.physical_write(ewb_write),
	.physical_wdata(ewb_data),
	.physical_address(l2_address1)
);

EWB EWB_buffer
(
	.*,
	.l2_write(ewb_write),
	.l2_data(ewb_data),
	.l2_address(l2_address1),
	.pmem_resp(physical_resp),
	.pmem_wdata(physical_wdata),
	.pmem_write(physical_write),
	.l2_read(physical_read)
);

endmodule
