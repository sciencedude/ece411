module array #(parameter width = 8)
(
	input clk,
	input logic [2:0] address,
	input logic [width-1:0] w_data,
	input logic write,
	output logic [width-1:0] r_data
);


logic [width-1:0] data [7:0];

initial
begin
    data[0] = 0;
	 data[1] = 0;
	 data[2] = 0;
	 data[3] = 0;
	 data[4] = 0;
	 data[5] = 0;
	 data[6] = 0;
	 data[7] = 0;
end
		
		always_ff@(posedge clk)
		begin
				if(write)
				data[address] = w_data;
		end
		
		always_comb
		begin
				r_data = data[address];
		end

endmodule
		
	