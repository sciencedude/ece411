module L2_control
(
	input logic clk,
					pmem_read,
					pmem_write,
					physical_resp,
					
	input logic valid_out0, valid_out1, valid_out2, valid_out3,
					dirty_out0, dirty_out1, dirty_out2, dirty_out3,
      			hit0, hit1, hit2, hit3, hit,
	
	input logic reset_l2hits, reset_l2miss,
					
	input	logic [1:0] LRU_out0, LRU_out1, LRU_out2, LRU_out3,
	
	output logic physical_read,
					 physical_write,
					 pmem_resp,
					 
	output logic [1:0] pwdatamux_sel,
	
	output logic [2:0] address_mux_sel,
	
	output logic [15:0] miss, actual_hits,
					 
	output logic dirty_write_val, wdatamux_sel,
					 data_write0, data_write1, data_write2, data_write3,
					 tag_write0, tag_write1, tag_write2, tag_write3,
					 valid_write0, valid_write1, valid_write2, valid_write3,
					 dirty_write0, dirty_write1, dirty_write2, dirty_write3,
					 LRU_write0, LRU_write1, LRU_write2, LRU_write3,
					 reset0,reset1,reset2,reset3
);

enum int unsigned {read_write, read_from_mem, write_to_mem} state, next_state;

always_ff@(posedge clk)
begin
	state <= next_state;
end

always_comb
begin
	next_state = state;
	case(state)
		read_write: begin
							if(~hit & (pmem_read | pmem_write))
							begin 
								if((valid_out0&&valid_out1&&valid_out2&&valid_out3)&&((dirty_out0 && LRU_out0 == 3) | (dirty_out1 && LRU_out1 == 3) | (dirty_out2 && LRU_out2 == 3) | (dirty_out3 && LRU_out3 == 3)))
										next_state = write_to_mem;
								else
									next_state = read_from_mem;
							end
						end
		read_from_mem : begin
							if(physical_resp)
								next_state = read_write;
							end
		write_to_mem : begin 
							if(physical_resp)
								next_state = read_from_mem;
						end
	endcase
end
logic [15:0] hits;
initial
 begin
miss = 16'h0;
hits = 16'h0;
end
always_ff @(posedge clk or posedge reset_l2miss or posedge reset_l2hits)
begin
	if(reset_l2hits)
	hits <= 0;
	else if(reset_l2miss)
	miss <= 0;
	else if(physical_resp && state ==  read_from_mem)
	miss+=1;
	else if(pmem_read & hit)
	hits+=1;
end
assign actual_hits = hits/2;

always_comb
begin
	physical_read = 1'b0;
	physical_write = 1'b0;
	pmem_resp = 1'b0;
	data_write0 = 1'b0;
	data_write1 = 1'b0;
	data_write2 = 1'b0;
	data_write3 = 1'b0;
	dirty_write0 = 1'b0;
	dirty_write1 = 1'b0;
	dirty_write2 = 1'b0;
	dirty_write3 = 1'b0;
	dirty_write_val = 1'b0;
	LRU_write0 = 1'b0;
	LRU_write1 = 1'b0;
	LRU_write2 = 1'b0;
	LRU_write3 = 1'b0;
	tag_write0 = 1'b0;
	tag_write1 = 1'b0;
	tag_write2 = 1'b0;
	tag_write3 = 1'b0;
	valid_write0 = 1'b0;
	valid_write1 = 1'b0;
	valid_write2 = 1'b0;
	valid_write3 = 1'b0;
	wdatamux_sel = 1'b0;
	address_mux_sel = 3'h4;
	pwdatamux_sel = 2'b00;
	reset0 = 1'b0;
	reset1 = 1'b0;
	reset2 = 1'b0;
	reset3 = 1'b0;
	
	case(state)
	read_write: begin
						if(hit & (pmem_read|pmem_write))
							pmem_resp = 1'b1;
						if(pmem_write)	begin
							data_write0 = hit0;
							data_write1 = hit1;
							data_write2 = hit2;
							data_write3 = hit3;
							dirty_write0 = hit0;
							dirty_write1 = hit1;
							dirty_write2 = hit2;
							dirty_write3 = hit3;
							dirty_write_val = 1'b1;
						end
						if(hit &(pmem_read|pmem_write))	
						begin
							if(((LRU_out0<=LRU_out1)&&hit1)||((LRU_out0<=LRU_out2)&&hit2)||((LRU_out0<=LRU_out3)&&hit3))
								LRU_write0 <= 1'b1;
							if(((LRU_out1<=LRU_out0)&&hit0)||((LRU_out1<=LRU_out2)&&hit2)||((LRU_out1<=LRU_out3)&&hit3))
								LRU_write1 <= 1'b1;
							if(((LRU_out2<=LRU_out1)&&hit1)||((LRU_out2<=LRU_out0)&&hit0)||((LRU_out2<=LRU_out3)&&hit3))
								LRU_write2 <= 1'b1;
							if(((LRU_out3<=LRU_out1)&&hit1)||((LRU_out3<=LRU_out2)&&hit2)||((LRU_out3<=LRU_out0)&&hit0))
								LRU_write3 <= 1'b1;
							reset0 = hit0;
							reset1 = hit1;
							reset2 = hit2;
							reset3 = hit3;
						end
					end
	read_from_mem : begin
							physical_read = 1'b1;
							wdatamux_sel = 1'b1;
							if((LRU_out0 == 3) | ~valid_out0)	begin
								data_write0 = 1'b1;
								tag_write0 = 1'b1;
							end
							else if ((LRU_out1 == 3) | ~valid_out1)	begin
								data_write1 = 1'b1;
								tag_write1 = 1'b1;
							end
							else if ((LRU_out2 == 3) | ~valid_out2)	begin
								data_write2 = 1'b1;
								tag_write2 = 1'b1;
							end
							else if((LRU_out3 == 3) | ~valid_out3)begin
								data_write3 = 1'b1;
								tag_write3 = 1'b1;
							end
							
							valid_write0 = data_write0;
							valid_write1 = data_write1;
							valid_write2 = data_write2;
							valid_write3 = data_write3;
						end
	write_to_mem : begin
							//if(physical_resp)
							physical_write = 1'b1;
							if(LRU_out0 == 3)
								dirty_write0 = 1'b1;
							else if(LRU_out1 == 3)
							begin
								dirty_write1 = 1'b1;
								pwdatamux_sel = 2'b01;
							end
							else if(LRU_out2 == 3)
							begin
								dirty_write2 = 1'b1;
								pwdatamux_sel = 2'b10;
							end
							else if(LRU_out3 == 3)
							begin
								dirty_write3 = 1'b1;
								pwdatamux_sel = 2'b11;
							end
							dirty_write_val = 1'b0;
							address_mux_sel = {1'b0,pwdatamux_sel};
						end
	endcase
end

endmodule