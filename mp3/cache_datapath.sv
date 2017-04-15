module cache_datapath
(
	input logic clk,
	input logic [8:0] tag,
	input logic [2:0] set,
	input logic [2:0] offset,
	input logic LRU_write,
	input logic tag_write,
	input logic valid_write,
	input logic data_write,
	input logic [15:0] mem_wdata,
	input logic [127:0] pmem_rdata,
	input logic datamux_sel,
	input logic MSBmux_sel,
	input logic LSBmux_sel,
	input logic [1:0] mem_byte_enable,
	input logic pmem_resp,
	input logic dirty_write_val,
	input logic dirty_write,
	input logic addrmux_sel,
	input logic write_mux_sel,
	
	output logic found,
	output logic dirty,
	output logic [127:0] pmem_wdata,
	output logic [15:0] mem_rdata,
	output logic cout_1, cout_2,
	output logic [15:0] pmem_address
);

logic LRU_out0, LRU_out1;
logic valid_out0, valid_out1;
logic w1,w2;
logic [8:0] tag_out0, tag_out1, tagmux_out;
logic [127:0] Copy_out, datamux_out, dataarray_out0, dataarray_out1;
logic [7:0] MSB_decoder_out, LSB_decoder_out, MSB_muxout, LSB_muxout, MSB_sel, LSB_sel;

array#(1) LRU_0
(
	.clk,
	.address(set),
	.w_data(~cout_2),
	.write(found&LRU_write),
	.r_data(LRU_out0)
);

array#(9) tag_0
(
	.clk,
	.address(set),
	.w_data(tag),
	.write(!LRU_out0 & tag_write),
	.r_data(tag_out0)
);

array#(9) tag_1
(
	.clk,
	.address(set),
	.w_data(tag),
	.write(LRU_out0 & tag_write),
	.r_data(tag_out1)
);

Compare C0
(
	.a(tag_out0),
	.b(tag),
	.result(cout_1)
);

Compare C1
(
	.a(tag_out1),
	.b(tag),
	.result(cout_2)
);

array#(1) valid_0
(
	.clk,
	.address(set),
	.w_data(pmem_resp),
	.write(valid_write & !LRU_out0),
	.r_data(valid_out0)
);


array#(1) valid_1
(
	.clk,
	.address(set),
	.w_data(pmem_resp),
	.write(valid_write & LRU_out0),
	.r_data(valid_out1)
);

assign found = cout_2 & valid_out1 | cout_1 & valid_out0;

copy Copy
(
	.in(mem_wdata),
	.out(Copy_out)
);

mux2#(128) data_mux
(
	.sel(datamux_sel),
	.a(Copy_out),
	.b(pmem_rdata),
	.f(datamux_out)
);

decoder MSB_decoder
(
	.in(offset),
	.out(MSB_decoder_out)
);
	
decoder LSB_decoder
(
	.in(offset),
	.out(LSB_decoder_out)
);


always_comb
begin
	MSB_sel[0] = MSB_decoder_out[0] & mem_byte_enable[1];
	MSB_sel[1] = MSB_decoder_out[1] & mem_byte_enable[1];
	MSB_sel[2] = MSB_decoder_out[2] & mem_byte_enable[1];
	MSB_sel[3] = MSB_decoder_out[3] & mem_byte_enable[1];
	MSB_sel[4] = MSB_decoder_out[4] & mem_byte_enable[1];
	MSB_sel[5] = MSB_decoder_out[5] & mem_byte_enable[1];
	MSB_sel[6] = MSB_decoder_out[6] & mem_byte_enable[1];
	MSB_sel[7] = MSB_decoder_out[7] & mem_byte_enable[1];
	
	LSB_sel[0] = LSB_decoder_out[0] & mem_byte_enable[0];
	LSB_sel[1] = LSB_decoder_out[1] & mem_byte_enable[0];
	LSB_sel[2] = LSB_decoder_out[2] & mem_byte_enable[0];
	LSB_sel[3] = LSB_decoder_out[3] & mem_byte_enable[0];
	LSB_sel[4] = LSB_decoder_out[4] & mem_byte_enable[0];
	LSB_sel[5] = LSB_decoder_out[5] & mem_byte_enable[0];
	LSB_sel[6] = LSB_decoder_out[6] & mem_byte_enable[0];
	LSB_sel[7] = LSB_decoder_out[7] & mem_byte_enable[0];
end

mux2#(8) MSB_mux
(
	.sel(MSBmux_sel),
	.a(MSB_sel),
	.b(8'hff),
	.f(MSB_muxout)
);

mux2#(8) LSB_mux
(
	.sel(LSBmux_sel),
	.a(LSB_sel),
	.b(8'hff),
	.f(LSB_muxout)
);

mux2#(1) wmux
(
	.sel(write_mux_sel),
	.a(data_write & !LRU_out0),
	.b(cout_1 & data_write & valid_out0),
	.f(w1)
);
mux2#(1) wmux2
(
	.sel(write_mux_sel),
	.a(data_write & LRU_out0),
	.b(cout_2 & data_write & valid_out1),
	.f(w2)
);

dataarray Dataarray_0
(
	.clk,
	.address(set),
	.w_data(datamux_out),
	.write(w1),
	.MSB(MSB_muxout),
	.LSB(LSB_muxout),
	.r_data(dataarray_out0)
);

dataarray Dataarray_1
(
	.clk,
	.address(set),
	.w_data(datamux_out),
	.write(w2),//this is making some data write not happend because they aren't the lru at the time we try to write to them look at 60022 ns and 63480 ns to see this happen
	.MSB(MSB_muxout),
	.LSB(LSB_muxout),
	.r_data(dataarray_out1)
);


mux2#(128) pmem_mux
(
	.sel(cout_2 & valid_out1),
	.a(dataarray_out0),
	.b(dataarray_out1),
	.f(pmem_wdata)
);

mux8 memread_mux
(
	.sel(offset),
	.a(pmem_wdata[15:0]),
	.b(pmem_wdata[31:16]),
	.c(pmem_wdata[47:32]),
	.d(pmem_wdata[63:48]),
	.e(pmem_wdata[79:64]),
	.f(pmem_wdata[95:80]),
	.g(pmem_wdata[111:96]),
	.h(pmem_wdata[127:112]),
	.out(mem_rdata)
);


array #(1) dirtyarray_0
(
	.clk,
	.address(set),
	.w_data(dirty_write_val),
	.write((cout_1 & dirty_write) || (dirty_write & ~LRU_out0)),
	.r_data(dirty_1)
);

array #(1) dirtyarray_1
(
	.clk,
	.address(set),
	.w_data(dirty_write_val),
	.write((cout_2 & dirty_write) || (dirty_write & LRU_out0)),
	.r_data(dirty_2)
);

mux2 #(9) tagmux
(
	.sel(cout_2),
	.a(tag_out0),
	.b(tag_out1),
	.f(tagmux_out)
);


mux2 #(16) addrmux
(
	.sel(addrmux_sel),
	.a({tag ,set,offset, 1'b0}),
	.b({tagmux_out, set, offset, 1'b0}),
	.f(pmem_address)
);

mux2 #(1) dirtymux
(
	.sel(LRU_out0),
	.a(dirty_1),
	.b(dirty_2),
	.f(dirty)
);
endmodule
