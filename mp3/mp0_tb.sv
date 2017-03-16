module mp0_tb;

timeunit 1ns;
timeprecision 1ns;

logic clk;
logic mem_resp;
logic mem_read;
logic mem_write;
logic [1:0] mem_byte_enable;
logic [15:0] mem_address;
logic [15:0] address_d;
logic [15:0] mem_rdata;
logic [15:0] mem_wdata;
logic [15:0] data;
/* Clock generator */
initial clk = 0;
always #5 clk = ~clk;

datapath dut
(
    .clk,
    .instruction(mem_rdata),
	 .data,
	 .address_i(mem_address),
	 .address_d,
	 .mem_write,
	 .mem_wdata
);

magic_memory memory
(
    .clk,
   .read(1'b1),
   .write(mem_write),
   .wmask(mem_byte_enable),
   .address(mem_address),
   .wdata(),
   .resp(mem_resp),
   .rdata(mem_rdata)
);

magic_memory memory2
(
    .clk,
   .read(1'b1),
   .write(mem_write),
   .wmask(2'b11),
   .address(address_d),
   .wdata(mem_wdata),
   .resp(),
   .rdata(data)
);

endmodule : mp0_tb
