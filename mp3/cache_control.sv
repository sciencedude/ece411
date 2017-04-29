module cache_control
(
	input clk,
	input logic mem_read,
	input logic mem_write,
	output logic mem_resp,
	output logic pmem_read,
	output logic pmem_write,
	input logic pmem_resp,
	input logic hit,
	input logic hit_out,
	input logic dirty1_out,
	input logic dirty2_out,
	input logic vaild1_out,
	input logic vaild2_out,
	output logic set1_load,
	output logic set2_load,
	output logic tag1_load,
	output logic tag2_load,
	output logic dirty1_in,
	output logic dirty2_in,
	output logic dirty1_load,
	output logic dirty2_load,
	output logic vaild1_in,
	output logic vaild2_in,
	output logic vaild1_load,
	output logic vaild2_load,	
	input logic lru_out,
	output logic lru_load,
	output logic pmem_address_sel,
	output logic setin_mux_sel,
	output logic [15:0] hits,miss,
	input logic reset_hits,reset_miss
);



enum int unsigned {
hread,
miss_s,
getd
} state, next_state;


initial
 begin
miss = 16'h0;
hits = 16'h0;
end
always_ff @(posedge clk or posedge reset_miss or posedge reset_hits)
begin
	if(reset_hits)
	hits <= 0;
	else if(reset_miss)
	miss <= 0;
	else if(pmem_resp && state ==  getd)
	miss+=1;
	else if(hit == 1 && (mem_read == 1 || mem_write == 1))
	hits+=1;
end





always_comb
begin : state_actions
	set1_load	= 1'b0;
	set2_load	= 1'b0;
	tag1_load	= 1'b0;
	tag2_load	= 1'b0;
	dirty1_in	= 1'b0;
	dirty2_in	= 1'b0;
	dirty1_load	= 1'b0;
	dirty2_load	= 1'b0;
	vaild1_in	= 1'b0;
	vaild2_in	= 1'b0;
	vaild1_load	= 1'b0;
	vaild2_load	= 1'b0;
	mem_resp		= 1'b0;
	pmem_read	= 1'b0;
	pmem_write	= 1'b0;
	lru_load		= 1'b0;
	pmem_address_sel = 1'b1;
	setin_mux_sel	= 1'b0;
	case(state)
	hread:begin
		if(hit == 1 && mem_read == 1 )
		begin
			mem_resp = 1'b1;
			lru_load = 1'b1;
		end
		if(hit == 1 && mem_write == 1)
		begin
			mem_resp = 1'b1;
			setin_mux_sel = 1;
			if(hit_out == 0)
			begin
				set1_load = 1;
				dirty1_load = 1;
				dirty1_in = 1;
			end
			if(hit_out == 1)
			begin
				set2_load = 1;
				dirty2_load = 1;
				dirty2_in = 1;
			end
		end
	end
	miss_s:begin
		if(lru_out == 0 && dirty1_out == 1 && vaild1_out == 1)pmem_write = 1'b1;
		if(lru_out == 1 && dirty2_out == 1 && vaild2_out == 1)pmem_write = 1'b1;
		pmem_address_sel = 1'b0;
	end
	getd:begin
		pmem_read = 1'b1;
		if(lru_out == 0) 
		begin
			set1_load = 1;
			vaild1_load = 1;
			vaild1_in = 1;
			tag1_load = 1;
			dirty1_load = 1;
			dirty1_in = 0;
		end
		else 
		begin
			set2_load = 1;
			vaild2_load = 1;
			vaild2_in = 1;
			tag2_load = 1;
			dirty2_load = 1;
			dirty2_in = 0;
		end
	end
	default: /* Do nothing */;
	endcase
end

always_comb
begin : next_state_logic

	next_state = state;
	case(state)
	hread:begin
		if(hit == 0 &&(mem_read == 1 || mem_write == 1))next_state = miss_s;
	end
	miss_s:begin
		if(pmem_write == 0) next_state = getd;
		else if(pmem_resp == 1) next_state = getd;
	end
	getd:begin
		if(pmem_resp == 1)next_state = hread;
	end
	default: /* Do nothing */;
	endcase
end

always_ff @(posedge clk)
begin: next_state_assignment
    state <= next_state;
end


endmodule : cache_control