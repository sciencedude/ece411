import lc3b_types ::*;

module datapath
(
	input logic clk,
	input lc3b_word instruction,
	input lc3b_word data,
	output lc3b_word address_i,
	output lc3b_word address_d,
	output lc3b_word mem_wdata
);

lc3b_word intr;
lc3b_word alu_out;
logic branch_enable, load_regfile;
lc3b_reg dest;
IF_ID if_id;
lc3b_word regfile_in;
ID_EX id_ex1;
EX_MEM ex_mem_out;
lc3b_word mem_rdata;
MEM_WB mem_wb_out;
MEM_WB mem_wb;
assign alu_out = mem_wb_out.alu_out;

fetch F(.*, .address(address_i), .intr(instruction));
decode D(.*);
execute E(.*,.id_ex_out(id_ex1));
mem_stage M(.*, .ex_mem(ex_mem_out),.address(address_d), .mem_rdata(data));
wb_stage W(.*, .mem_wb(mem_wb_out));

endmodule