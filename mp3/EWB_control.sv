import lc3b_types::*;

module EWB_control
(
	input clk,
	input pmem_resp,
	input l2_evict,
	input l2_write,
	input l2_read,
	input lc3b_word l2_address,
	//input lc3b_word ewb_address,
	output logic isEmpty,
	output logic isReady,
	//output lc3b_word pmem_address,
	output logic pmem_write
);

enum int unsigned {
	s_wait,
	s_wait2, 
	s_write
} state, next_state;

always_comb
begin
	isEmpty = 1'b0;
	isReady = 1'b0;
	pmem_write = 1'b0;
	//pmem_address = l2_address;
	
	case(state)
		s_wait: begin
			isEmpty = 1'b1;
			isReady = 1'b1;
		end
		
		s_wait2: begin
			isReady = 1'b1;
		end
		
		s_write: begin
			pmem_write = 1'b1;
			//pmem_address = ewb_address;
		end
	endcase
end

always_comb
begin: next_state_logic
	next_state = state;
	case(state)
		s_wait: begin
			if(l2_evict)
				next_state = s_wait2;
		end
		
		s_wait2: begin
			if(!l2_write && !l2_read)
				next_state = s_write;
		end
		
		s_write: begin
			if(pmem_resp)
				next_state = s_wait;
		end
		
		default: next_state = s_wait;
	endcase
end

always_ff @(posedge clk)
begin
	state <= next_state;
end

endmodule : EWB_control