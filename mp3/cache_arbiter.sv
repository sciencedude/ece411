import lc3b_types::*;

module cache_arbiter
(
	input clk,
	input logic pmem_read_i,
	input logic pmem_read_d,
	input logic pmem_write_d,
	input logic pmem_write_i,
	input logic mem_resp,
	input logic pmem_resp,
	
	output logic pmem_read,
	output logic pmem_write,
	output logic pmem_resp_i,
	output logic pmem_resp_d,
	output logic I_D_out
);

enum int unsigned {unlock,lock} state, next_state;

always_ff@(posedge clk)
begin
state <= next_state;
end


always_comb
begin
	next_state = state;
	case(state)
	lock : if(pmem_resp)
				next_state = unlock;
	unlock : if(pmem_read_i|pmem_write_i|pmem_read_d|pmem_write_d)
					next_state = lock;
	endcase
end

always_comb
begin
	pmem_read = 1'b0;
	pmem_write = 1'b0;
	I_D_out = 1'b0;
	pmem_resp_d = 1'b0;
	pmem_resp_i = 1'b0;
	case(state)
		unlock:;
		lock : begin
			if(pmem_read_i|pmem_write_i)	begin
				pmem_read = pmem_read_i;
				pmem_write = pmem_write_i;
				pmem_resp_i = pmem_resp;
			end
			else	begin
				pmem_read = pmem_read_d;
				pmem_write = pmem_write_d;
				pmem_resp_d = pmem_resp;
				I_D_out = 1'b1;
			end
		end
	endcase
	
end
			
			
endmodule	