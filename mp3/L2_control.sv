module L2_control
(
	input logic clk,
					pmem_read,
					pmem_write,
					physical_resp,
					
	input logic valid_out0, valid_out1, valid_out2, valid_out3,
					dirty_out0, dirty_out1, dirty_out2, dirty_out3,
      			hit0, hit1, hit2, hit3, hit,
					isEmpty, isReady,
					
	input	logic [1:0] LRU_out0, LRU_out1, LRU_out2, LRU_out3,
	
	output logic physical_read,
					 physical_write,
					 pmem_resp,
	
	output logic [2:0] address_mux_sel,
					 
	output logic dirty_write_val, wdatamux_sel,
					 data_write0, data_write1, data_write2, data_write3,
					 tag_write0, tag_write1, tag_write2, tag_write3,
					 valid_write0, valid_write1, valid_write2, valid_write3,
					 dirty_write0, dirty_write1, dirty_write2, dirty_write3,
					 LRU_write0, LRU_write1, LRU_write2, LRU_write3,
					 load_ewb, l2_evict
);

enum int unsigned {read_write, read_from_mem, write_to_mem} state, next_state;

logic [1:0] add;

magic MA(.hit0(dirty_write0), .hit1(dirty_write1), .hit2(dirty_write2), .hit3(dirty_write3), .rdatamux_sel(add));

always_ff@(posedge clk)
begin
	state <= next_state;
end

always_comb
begin
	next_state = state;
	case(state)
		read_write: if(~hit & (pmem_read | pmem_write))
							next_state = read_from_mem;
		read_from_mem : begin
								if((dirty_out0 && LRU_out0 == 3) | (dirty_out1 && LRU_out1 == 3) | (dirty_out2 && LRU_out2 == 3) | (dirty_out3 && LRU_out3 == 3))
								begin
									if(isEmpty)
										next_state = write_to_mem;
									else
										next_state = read_from_mem;
								end
								else if(physical_resp)
									next_state = read_write;
							end
		write_to_mem : if(physical_resp)
								next_state = read_from_mem;
	endcase
end

int hits = 0;
int miss = 0;
always_ff @(posedge clk)
begin
	if(pmem_read & hit)
	hits+=1;
end
always_ff @(posedge clk)
begin
	if(physical_resp && state ==  read_from_mem)
	miss+=1;
end
int actual_hits;
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
	l2_evict = 1'b0;
	load_ewb = 1'b0;
	address_mux_sel = 3'h4;
	
	
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
						if(~(LRU_out0 == 3 || LRU_out1 == 3 || LRU_out2 == 3 || LRU_out3 == 3))	begin
						LRU_write0 = 1'b1;
						LRU_write1 = 1'b1;
						LRU_write2 = 1'b1;
						LRU_write3 = 1'b1;
						end
					end
	read_from_mem : begin
							if(isReady)
							begin
								physical_read = 1'b1;
								wdatamux_sel = 1'b1;
								if((LRU_out0 && 3) | ~valid_out0)	begin
									data_write0 = 1'b1;
									tag_write0 = 1'b1;
								end
								else if ((LRU_out1 && 3) | ~valid_out1)	begin
									data_write1 = 1'b1;
									tag_write1 = 1'b1;
								end
								else if ((LRU_out2 && 3) | ~valid_out2)	begin
									data_write2 = 1'b1;
									tag_write2 = 1'b1;
								end
								else begin
									data_write3 = 1'b1;
									tag_write3 = 1'b1;
								end
								
								valid_write0 = data_write0;
								valid_write1 = data_write1;
								valid_write2 = data_write2;
								valid_write3 = data_write3;
							end
							
						end
	write_to_mem : begin
							//if(physical_resp)
								physical_write = 1'b1;
							l2_evict = 1'b1;
							if(isEmpty)
								load_ewb = 1'b1;
							if(LRU_out0 == 3)
								dirty_write0 = 1'b1;
							if(LRU_out1 == 3)
								dirty_write1 = 1'b1;
							if(LRU_out2 == 3)
								dirty_write2 = 1'b1;
							if(LRU_out3 == 3)
								dirty_write3 = 1'b1;
							dirty_write_val = 1'b0;
							address_mux_sel = {1'b0,add};
						end
	endcase
end

endmodule