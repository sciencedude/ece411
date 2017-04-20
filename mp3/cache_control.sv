module cache_control
(
input logic clk,
input logic [15:0] mem_address,
input logic mem_read,
input logic mem_write,
input logic dirty,
input logic pmem_resp,
input logic found,
input logic cout_1, cout_2,


output logic mem_resp,
output logic [8:0] tag,
output logic [2:0] set,
output logic [2:0] offset,
output logic LRU_write,
output logic valid_write,
output logic data_write,
output logic tag_write,
output logic datamux_sel,
output logic MSBmux_sel,
output logic LSBmux_sel,
output logic dirty_write_val,
output logic dirty_write,
output logic pmem_read,
output logic pmem_write,
output logic write_mux_sel,
output logic addrmux_sel
);


assign tag = mem_address[15:7];
assign set = mem_address[6:4];
assign offset = mem_address[3:1];

enum int unsigned {
idle,
read,
write,
read_from_mem,
write_to_mem
} state, next_state;


always_ff@(posedge clk)
begin
	state = next_state;
end

int hits = 0;
int miss = 0;
int actual_hits;
always_ff@(negedge clk)
begin
	if(pmem_resp & state == read_from_mem)
	miss+=1;
	if(mem_resp)
	hits+=1;
end
assign actual_hits = hits-miss;

always_comb
begin : nextstatetable

	next_state = state;

	case(state)
		
		idle : begin
			if(mem_read)
			next_state = read;
			else if(mem_write)
			next_state = write;
		end
		
		
		read : begin
			if(found)
			next_state = idle;
			
			else
			next_state = read_from_mem;
		end
		
		write : begin
			if(found)
			next_state = idle;
			else
			next_state = read_from_mem;
		end
		
		read_from_mem: begin
			if((~cout_1 | ~cout_2) & dirty)
			next_state = write_to_mem;
			else if(pmem_resp && mem_read)
			next_state = read;
			else if (pmem_resp && mem_write)
			next_state = write;
		end
		
		write_to_mem: begin
			if(pmem_resp)
			next_state = read_from_mem;
		end
	
	endcase
	
end




always_comb
begin
	LRU_write = 1'b0;
	valid_write = 1'b0;
	data_write = 1'b0;
	tag_write = 1'b0;
	datamux_sel = 1'b0;
	MSBmux_sel = 1'b0;
	LSBmux_sel = 1'b0;
	dirty_write_val = 1'b0;
	dirty_write = 1'b0;
	pmem_read = 1'b0;
	pmem_write = 1'b0;
	addrmux_sel = 1'b0;
	mem_resp = 1'b0;
	write_mux_sel = 1'b0;
	
	case(state)
	
	idle: ;
	
	read: begin
			LRU_write = 1;
			mem_resp = found;
			end
	
	write:	begin
					if(~cout_1 & ~cout_2)	begin
					end
					else	begin
					data_write = 1'b1;
					dirty_write = 1'b1;
					dirty_write_val = 1'b1;
					LRU_write = 1'b1;
					mem_resp = found;
					write_mux_sel = 1'b1;
					end
				end
				
	read_from_mem: begin
							if((~cout_1 | ~cout_2) & dirty)	begin
							tag_write = 1'b0;
							end
							else begin
							tag_write = 1'b1;
							data_write = 1'b1;
							valid_write = 1'b1;
							MSBmux_sel = 1'b1;
							LSBmux_sel = 1'b1;
							pmem_read = 1'b1;
							datamux_sel = 1'b1;
							end
						end
						
	write_to_mem:	begin
							pmem_write = 1'b1;
							dirty_write = 1'b1;
							dirty_write_val = 1'b0;
							addrmux_sel = 1'b1;
						end
						
	endcase

	
end



endmodule 


