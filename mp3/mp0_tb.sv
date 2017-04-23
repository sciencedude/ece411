module mp0_tb;

timeunit 1ns;
timeprecision 1ns;

logic clk;
logic physical_resp;
logic [127:0] physical_rdata;
logic physical_read;
logic physical_write;
logic [127:0] physical_wdata;
logic [15:0] physical_address;
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
	.read(physical_read),
	.write(physical_write),
	.address(physical_address),
	.wdata(physical_wdata),
	.resp(physical_resp),
	.rdata(physical_rdata)
);


endmodule : mp0_tb
