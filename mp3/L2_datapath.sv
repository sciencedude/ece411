module L2_datapath
(
	input logic	wdatamux_sel,
					clk,
					physical_resp,
					dirty_write_val,
					data_write0, data_write1, data_write2, data_write3,
					tag_write0, tag_write1, tag_write2, tag_write3,
					valid_write0, valid_write1, valid_write2, valid_write3,
					dirty_write0, dirty_write1, dirty_write2, dirty_write3,
					LRU_write0, LRU_write1, LRU_write2, LRU_write3,
					reset0,reset1,reset2,reset3,
	input logic [2:0] address_mux_sel,

	input logic [1:0] pwdatamux_sel,
	input logic [15:0] address,
	input logic [127:0] pmem_wdata,
	input logic [127:0] physical_rdata,
	
	output logic valid_out0, valid_out1, valid_out2, valid_out3,
	output logic dirty_out0, dirty_out1, dirty_out2, dirty_out3,
	output logic hit0, hit1, hit2, hit3,
	output logic [1:0] LRU_out0, LRU_out1, LRU_out2, LRU_out3,
	output logic hit,
	output logic [15:0] physical_address,
	output logic [127:0] physical_wdata, pmem_rdata
);

logic [127:0] data_wdata;
//logic [2:0] offset;
logic [4:0] index;
logic [6:0] tag;
//assign offset = address[2:0];
assign index = address[8:4];
assign tag = address[15:9];
logic [127:0] data_out0, data_out1, data_out2, data_out3;
logic [6:0] tag_out0, tag_out1, tag_out2, tag_out3;
logic cout0, cout1, cout2, cout3;
assign hit0 = cout0 & valid_out0;
assign hit1 = cout1 & valid_out1;
assign hit2 = cout2 & valid_out2;
assign hit3 = cout3 & valid_out3;
assign hit = hit0|hit1|hit2|hit3;
logic [1:0] rdatamux_sel;
logic [6:0] tag_out0in, tag_out1in, tag_out2in, tag_out3in;
logic valid_out0in, valid_out1in, valid_out2in, valid_out3in;
logic dirty_out0in, dirty_out1in, dirty_out2in, dirty_out3in;
logic [1:0] LRU_out0in, LRU_out1in, LRU_out2in, LRU_out3in;
logic [127:0] data_out0in, data_out1in, data_out2in, data_out3in;

mux2#(128) data_write_mux
(
	.sel(wdatamux_sel),
	.a(pmem_wdata),
	.b(physical_rdata),
	.f(data_wdata)
);

mux4#(128) rdatamux
(
	.sel(rdatamux_sel),
	.a(data_out0),
	.b(data_out1),
	.c(data_out2),
	.d(data_out3),
	.f(pmem_rdata)
);

mux4#(128) physical_wdatamux
(
	.sel(pwdatamux_sel),
	.a(data_out0),
	.b(data_out1),
	.c(data_out2),
	.d(data_out3),
	.f(physical_wdata)
);

magic M0
(
	.hit0,
	.hit1,
	.hit2,
	.hit3,
	.rdatamux_sel
);
dataarray2 Dataarray0
(
	.clk,
	.data_write(data_write0),
	.index(index),
	.data_wdata,
	.data_out(data_out0)//in)
);

dataarray2 Dataarray1
(
	.clk,
	.data_write(data_write1),
	.index(index),
	.data_wdata,
	.data_out(data_out1)//in)
);

dataarray2 Dataarray2
(
	.clk,
	.data_write(data_write2),
	.index(index),
	.data_wdata,
	.data_out(data_out2)//in)
);

dataarray2 Dataarray3
(
	.clk,
	.data_write(data_write3),
	.index(index),
	.data_wdata,
	.data_out(data_out3)//in)
);


//register #(128) Dataarray0_reg
//(
//	.in(data_out0in),
//	.clk,
//	.load(1'b1),
//	.out(data_out0)
//);
//
//register #(128) Dataarray1_reg
//(
//	.in(data_out1in),
//	.clk,
//	.load(1'b1),
//	.out(data_out1)
//);
//
//register #(128) Dataarray2_reg
//(
//	.in(data_out2in),
//	.clk,
//	.load(1'b1),
//	.out(data_out2)
//);
//
//register #(128) Dataarray3_reg
//(
//	.in(data_out3in),
//	.clk,
//	.load(1'b1),
//	.out(data_out3)
//);

dataarray2 #(7) tag0
(
	.clk,
	.data_write(tag_write0),
	.index(index),
	.data_wdata(tag),
	.data_out(tag_out0)//in)
);

dataarray2 #(7) tag1
(
	.clk,
	.data_write(tag_write1),
	.index(index),
	.data_wdata(tag),
	.data_out(tag_out1)//in)
);

dataarray2 #(7) tag2
(
	.clk,
	.data_write(tag_write2),
	.index(index),
	.data_wdata(tag),
	.data_out(tag_out2)//in)
);

dataarray2 #(7) tag3
(
	.clk,
	.data_write(tag_write3),
	.index(index),
	.data_wdata(tag),
	.data_out(tag_out3)//in)
);

//register #(7) tag0_reg
//(
//	.in(tag_out0in),
//	.load(1'b1),
//	.out(tag_out0),
//	.clk
//);
//
//register #(7) tag1_reg
//(
//	.in(tag_out1in),
//	.load(1'b1),
//	.out(tag_out1),
//	.clk
//);
//
//register #(7) tag2_reg
//(
//	.in(tag_out2in),
//	.load(1'b1),
//	.out(tag_out2),
//	.clk
//);
//
//register #(7) tag3_reg
//(
//	.in(tag_out3in),
//	.load(1'b1),
//	.out(tag_out3),
//	.clk
//);

dataarray2 #(1) valid0
(
	.clk,
	.data_write(valid_write0),
	.index,
	.data_wdata(physical_resp),
	.data_out(valid_out0)//in)
);

dataarray2 #(1) valid1
(
	.clk,
	.data_write(valid_write1),
	.index,
	.data_wdata(physical_resp),
	.data_out(valid_out1)//in)
);

dataarray2 #(1) valid2
(
	.clk,
	.data_write(valid_write2),
	.index,
	.data_wdata(physical_resp),
	.data_out(valid_out2)//in)
);

dataarray2 #(1) valid3
(
	.clk,
	.data_write(valid_write3),
	.index,
	.data_wdata(physical_resp),
	.data_out(valid_out3)//in)
);

//register #(7) tag0_reg
//(
//	.in(tag_out0in),
//	.load(1'b1),
//	.out(tag_out0),
//	.clk
//);
//
//register #(7) tag1_reg
//(
//	.in(tag_out1in),
//	.load(1'b1),
//	.out(tag_out1),
//	.clk
//);
//
//register #(7) tag2_reg
//(
//	.in(tag_out2in),
//	.load(1'b1),
//	.out(tag_out2),
//	.clk
//);
//
//register #(7) tag3_reg
//(
//	.in(tag_out3in),
//	.load(1'b1),
//	.out(tag_out3),
//	.clk
//);

dataarray2 #(1) dirty0
(
	.clk,
	.data_write(dirty_write0),
	.index,
	.data_wdata(dirty_write_val),
	.data_out(dirty_out0)//in)
);

dataarray2 #(1) dirty1
(
	.clk,
	.data_write(dirty_write1),
	.index,
	.data_wdata(dirty_write_val),
	.data_out(dirty_out1)//in)
);

dataarray2 #(1) dirty2
(
	.clk,
	.data_write(dirty_write2),
	.index,
	.data_wdata(dirty_write_val),
	.data_out(dirty_out2)//in)
);

dataarray2 #(1) dirty3
(
	.clk,
	.data_write(dirty_write3),
	.index,
	.data_wdata(dirty_write_val),
	.data_out(dirty_out3)//in)
);

//register #(1) dirty_reg0
//(
//	.clk,
//	.in(dirty_out0in),
//	.load(1'b1),
//	.out(dirty_out0)
//);
//
//register #(1) dirty_reg1
//(
//	.clk,
//	.in(dirty_out1in),
//	.load(1'b1),
//	.out(dirty_out1)
//);
//
//register #(1) dirty_reg2
//(
//	.clk,
//	.in(dirty_out2in),
//	.load(1'b1),
//	.out(dirty_out2)
//);
//
//register #(1) dirty_reg3
//(
//	.clk,
//	.in(dirty_out3in),
//	.load(1'b1),
//	.out(dirty_out3)
//);


LRU LRU_0
(
	.clk,
	.LRU_write(LRU_write0),
	.index,
	.hit(reset0),
	.LRU_out(LRU_out0)//in)
);

LRU LRU_1
(
	.clk,
	.LRU_write(LRU_write1),
	.index,
	.hit(reset1),
	.LRU_out(LRU_out1)//in)
);


LRU LRU_2
(
	.clk,
	.LRU_write(LRU_write2),
	.index,
	.hit(reset2),
	.LRU_out(LRU_out2)//in)
);

LRU LRU_3
(
	.clk,
	.LRU_write(LRU_write3),
	.index,
	.hit(reset3),
	.LRU_out(LRU_out3)//in)
);

//register #(2) LRU_0reg
//(
//	.clk,
//	.in(LRU_out0in),
//	.load(1'b1),
//	.out(LRU_out0)
//);
//
//register #(2) LRU_1reg
//(
//	.clk,
//	.in(LRU_out1in),
//	.load(1'b1),
//	.out(LRU_out1)
//);
//
//register #(2) LRU_2reg
//(
//	.clk,
//	.in(LRU_out2in),
//	.load(1'b1),
//	.out(LRU_out2)
//);
//
//register #(2) LRU_3reg
//(
//	.clk,
//	.in(LRU_out3in),
//	.load(1'b1),
//	.out(LRU_out3)
//);

Compare #(7) Compare0
(
	.a(tag_out0),
	.b(tag),
	.result(cout0)
); 

Compare #(7) Compare1
(
	.a(tag_out1),
	.b(tag),
	.result(cout1)
); 

Compare #(7) Compare2
(
	.a(tag_out2),
	.b(tag),
	.result(cout2)
); 

Compare #(7) Compare3
(
	.a(tag_out3),
	.b(tag),
	.result(cout3)
);

mux8 #(16)	address_mux
(
	.sel(address_mux_sel),
	.a({tag_out0,index,4'h0}),
	.b({tag_out1,index,4'h0}),
	.c({tag_out2,index,4'h0}),
	.d({tag_out3,index,4'h0}),
	.e(address),
	.f(16'h0),
	.g(16'h0),
	.h(16'h0),
	.out(physical_address)
);

endmodule
