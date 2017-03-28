module dataarray
(
	input clk,
	input logic [2:0] address,
	input logic [127:0] w_data,
	input logic write,
	input logic [7:0] MSB, LSB,
	output logic [127:0]r_data
);

		logic [127:0] data [7:0];
		
initial
begin
    data[0] = 128'b0;
	 data[1] = 128'b0;
	 data[2] = 128'b0;
	 data[3] = 128'b0;
	 data[4] = 128'b0;
	 data[5] = 128'b0;
	 data[6] = 128'b0;
	 data[7] = 128'b0;
end
		
		
		always_ff@(posedge clk)
		begin
				if(write)
				begin
					case(MSB)
					8'h1: data[address][15:8] = w_data[15:8];
					8'h2: data[address][31:24] = w_data[31:24];
					8'h4: data[address][47:40] = w_data[47:40];
					8'h8: data[address][63:56] = w_data[63:56];
					8'h10: data[address][79:72] = w_data[79:72];
					8'h20: data[address][95:88] = w_data[95:88];
					8'h40: data[address][111:104] = w_data[111:104];
					8'h80: data[address][127:120] = w_data[127:120];
					8'hff: data[address] = w_data;
					default:;
					endcase
					
					
					case(LSB)
					8'h1: data[address][7:0] = w_data[7:0];
					8'h2: data[address][23:16] = w_data[23:16];
					8'h4: data[address][39:32] = w_data[39:32];
					8'h8: data[address][55:48] = w_data[55:48];
					8'h10: data[address][71:64] = w_data[71:64];
					8'h20: data[address][87:80] = w_data[87:80];
					8'h40: data[address][103:96] = w_data[103:96];
					8'h80: data[address][119:112] = w_data[119:112];
					8'hff: data[address] = w_data;
					default:;
					endcase
					
				end
				
		end
		
		always_comb
		begin
				r_data = data[address];
		end

endmodule