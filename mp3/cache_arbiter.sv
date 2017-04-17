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
	input logic found,
	
	output logic pmem_read,
	output logic pmem_write,
	output logic pmem_resp_i,
	output logic pmem_resp_d,
	output logic load_reg,
	output logic I_D_out
);

enum int unsigned {unlock, lock_i, preparelock_d, lock_d} state, next_state;

assign load_reg = pmem_read_d | pmem_read_i;

always_ff@(posedge clk)
begin
state <= next_state;
end


always_comb
begin
	next_state = state;
	case(state)
	lock_i : begin
				if(pmem_resp & (pmem_read_d | pmem_write_d))
				next_state = preparelock_d;
				else if(pmem_resp)
				next_state = unlock;
				end
	lock_d : begin
				if(pmem_resp)
				next_state = unlock;
				end
	unlock : begin
				if(pmem_read_d|pmem_write_d)
					next_state = preparelock_d;
				else if(pmem_read_i|pmem_write_i)
					next_state = lock_i;
				end
	preparelock_d: next_state = lock_d;
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
		preparelock_d: begin
						I_D_out = 1'b1;
					end
		lock_d : begin
				pmem_read = pmem_read_d;
				pmem_write = pmem_write_d;
				pmem_resp_d = pmem_resp;
				I_D_out = 1'b1;
				end
		lock_i :	begin
				pmem_read = pmem_read_i;
				pmem_write = pmem_write_i;
				pmem_resp_i = pmem_resp;
			end
	endcase
	
end
			
			
endmodule	