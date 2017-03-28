module mp0_tb;

timeunit 1ns;
timeprecision 1ns;

logic clk;
logic pmem_resp;
logic [127:0] pmem_rdata;
logic pmem_read;
logic pmem_write;
logic [127:0] pmem_wdata;
logic [15:0] pmem_address;
/* Clock generator */
initial clk = 0;
always #5 clk = ~clk;

datapath dut
(
    .*
);

physical_memory p_0
(
	.clk,
	.read(pmem_read),
	.write(pmem_write),
	.address(pmem_address),
	.wdata(pmem_wdata),
	.resp(pmem_resp),
	.rdata(pmem_rdata)
);


endmodule : mp0_tb
