import lc3b_types::*;

module EWB_control
(
	input clk,
	input pmem_resp,
	input l2_write,
	input l2_read,
	input lc3b_word l2_address,
	input lc3b_word ewb_address,
	output logic pmem_write, rdatamux_sel, load_ewb, l2_resp, physical_read
);

enum int unsigned {
	s_wait,
	s_resp,
	s_wait2, 
	s_write
} state, next_state;

always_comb
begin
	rdatamux_sel = 1'b0;
	load_ewb = 1'b0;
	l2_resp = pmem_resp;
	pmem_write = 1'b0;
	physical_read = l2_read;
	
	case(state)
		s_wait: begin
		end
		
		s_resp: begin
			l2_resp = 1'b1;
			load_ewb = 1'b1;
			physical_read = 1'b0;
		end
		
		s_wait2: begin
			if(l2_read && (ewb_address == l2_address))
			begin
				rdatamux_sel = 1'b1;
				l2_resp = 1'b1;
				physical_read = 1'b0;
			end
		end
		
		s_write: begin
			pmem_write = 1'b1;
			physical_read = 1'b0;
			l2_resp = 1'b0;
		end
	endcase
end

always_comb
begin: next_state_logic
	next_state = state;
	case(state)
		s_wait: begin
			if(l2_write)
				next_state = s_resp;
		end
		
		s_resp: begin
				next_state = s_wait2;
		end
		
		s_wait2: begin
			if(!l2_read)
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