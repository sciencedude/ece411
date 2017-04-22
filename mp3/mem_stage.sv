import lc3b_types::*;

module mem_stage
(
	input clk,
	input EX_MEM ex_mem,
	input lc3b_word mem_rdata,
	input mem_resp_d,
	input logic mem_resp_i,
	output MEM_WB mem_wb_out,
	output mem_write,
	output mem_read_d,
	input stall,
	output lc3b_word mem_wdata, address,
	output lc3b_mem_wmask wmask,
	output logic isI,
	output logic state,
	output logic mem_intr,
	output lc3b_word mem_pc,
	output lc3b_word mem_data,
	output logic [3:0] ex_mem_destreg,
	output lc3b_word ex_mem_data
);

lc3b_word marimux_out;
lc3b_word byteread_out;
lc3b_word ptr_out;
lc3b_word trapvector_out;
logic read;
logic write;
logic rwmux_sel;
logic marmux_sel;
logic loadPtr;
logic loadst;
logic stin;
lc3b_word regfile_in;


MEM_WB mem_wb_in;
//not sure if this mux is needed remember to bring this up
mux4 mar_mux
(
	.sel(ex_mem.control_signals.marmux_sel),
	.a(marimux_out),
	.b(ex_mem.srcb_out), //i have no idea why this is here scp
	.c(trapvector_out),
	.d(),
	.f(address)
);

zext_shift trapvector
(
	.in(ex_mem.intr[7:0]),
	.out(trapvector_out)
);

poniter ptr
(
	.isI(ex_mem.control_signals.isI),
	.mem_resp(mem_resp_d),
	.state,
	.marmux_sel,
	.loadPtr,
	.loadst,
	.rwmux_sel,
	.read,
	.stin,
	.write
);

register ptraddress
(
	.clk,
	.load(loadPtr),
	.in(mem_rdata),
	.out(ptr_out)
);

register #(.width(1)) st
(
	.clk,
	.load(loadst),
	.in(stin),
	.out(state)
);

mux2 mari_mux
(
	.sel(marmux_sel),
	.a(ex_mem.alu_out),
	.b(ptr_out),
	.f(marimux_out)
);


mux2 #(.width(1)) rmux
(
	.sel(rwmux_sel),
	.a(ex_mem.control_signals.mem_read_d),
	.b(read),
	.f(mem_read_d)
);

mux2 #(.width(1)) wmux
(
	.sel(rwmux_sel),
	.a(ex_mem.control_signals.mem_write),
	.b(write),
	.f(mem_write)
);

mux2 ldborder
(
	.sel(ex_mem.alu_out[0]),
	.a({8'b00000000,mem_rdata[7:0]}),
	.b({8'b00000000,mem_rdata[15:8]}),
	.f(byteread_out)
);

mux8 mdr_mux
(
	.sel(ex_mem.control_signals.mdr_mux_sel),
	.a(ex_mem.alu_out),
	.b(mem_rdata),
	.c(ex_mem.srcb_out), //added this because was in paper design scp
	.d({ex_mem.srcb_out[7:0],ex_mem.srcb_out[7:0]}),
	.e(byteread_out),
	.f(),
	.g(),
	.h(),
	.out(mem_wdata)
);
//this mask the bye mask for the L1 data cache
mem_mask_gen Mem_Mask_gen
(
	.address0(ex_mem.alu_out[0]),
	.intr(ex_mem.intr),
	.mask(wmask)
);

mux4 cc_mux
(
	.sel(ex_mem.control_signals.cc_mux_sel),
	.a(ex_mem.alu_out),
	.b(mem_wdata),
	.c(ex_mem.pc_out),
	.d(16'h0),
	.f(regfile_in)
);

//assign mem_wb.address = ex_mem.address;
assign mem_wb_in.mem_data = mem_wdata;
assign mem_wb_in.pc_out = ex_mem.pc_out;
assign mem_wb_in.alu_out = ex_mem.alu_out;
assign mem_wb_in.intr = ex_mem.intr;
assign mem_wb_in.brpredict = ex_mem.brpredict;
assign mem_wb_in.control_signals = ex_mem.control_signals;
assign mem_wb_in.destreg = ex_mem.destreg;
assign isI = ex_mem.control_signals.isI;
assign mem_intr = ex_mem.control_signals.mem_intr;
assign mem_pc = ex_mem.pc_out;
assign mem_data =  ex_mem.alu_out;
assign ex_mem_destreg = ex_mem.destreg;
//assign ex_mem_data = ex_mem.alu_out;
assign ex_mem_data = regfile_in;
//stall = 1 means don't stall
/*always_comb
begin
	if((ex_mem.control_signals.isI == 1 && state == 0) || mem_read_d== 1 || mem_write == 1) //add write to case 
	stall = mem_resp_d;
	else
	stall = 1'b1;
end
*/
register #(.width($bits(MEM_WB))) mem_wb
 (
	.clk,
	.in(mem_wb_in),
	.out(mem_wb_out),
	.load(stall)
 );

endmodule : mem_stage