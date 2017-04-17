module LRU
(
	input logic clk,
	input logic LRU_write,
	input logic [4:0] index,
	input logic hit,
	
	output logic [1:0] LRU_out
);

logic [1:0] data [31:0];

initial begin
	for(int i = 0; i < 32; i++)
		data[i] = 0;
end
	

always_ff@(posedge clk)
begin
	if(hit)
	data[index] <= 2'b00;
	else if(LRU_write && LRU_out < 3)
	data[index] <= LRU_out+2'b01;
end

always_comb
begin
	LRU_out = data[index];
end

endmodule
	