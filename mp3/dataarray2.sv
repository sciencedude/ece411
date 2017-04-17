module dataarray2#(parameter width = 128, parameter height = 32)
(
	input logic clk,
	input logic data_write,
	input logic [4:0] index,
	input logic [width-1:0] data_wdata,
	
	output logic [width-1:0] data_out
);

logic [width-1:0] data [height-1:0];

initial begin
	for (int i = 0; i < height; i++)
		data[i] = 0;
end

always_ff@(posedge clk)
begin	
	if(data_write)
	data[index] = data_wdata;
end

always_comb
begin
	data_out = data[index];
end

endmodule
