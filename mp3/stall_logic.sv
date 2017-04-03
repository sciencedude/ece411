import lc3b_types::*;

module stall_logic
(
	input mem_resp_i,
	input mem_resp_d,
	input mem_intr,
	input isI,
	input state,
	input got_intr_out,
	input got_data_out,
	output logic stall,
	output logic got_intr_load,
	output logic got_data_load,
	output logic got_intr_in,
	output logic got_data_in
);

always_comb
begin
	if((mem_resp_i == 1 || got_intr_out == 1)&&(((mem_resp_d == 1 || got_data_out == 1)&& mem_intr == 1)||mem_intr == 0)&&((isI == 1 && state == 1)||isI == 0))
		stall = 1;
	else 
		stall = 0;
		
	if(mem_resp_i == 1 && stall == 0)
	begin
		got_intr_load = 1'b1;
		got_intr_in = 1'b1;
	end
	else if(stall == 1)
	begin
		got_intr_load = 1'b1;
		got_intr_in = 1'b0;
	end
	else
	begin
		got_intr_load = 1'b0;
		got_intr_in = 1'b0;
	end
	
	if(mem_resp_d == 1 && stall == 0 && ((isI == 1 && state == 1)|| isI == 0) )
	begin
		got_data_load = 1'b1;
		got_data_in = 1'b1;
	end
	else if(stall == 1)
	begin
		got_data_load = 1'b1;
		got_data_in = 1'b0;
	end
	else
	begin
		got_data_load = 1'b0;
		got_data_in = 1'b0;
	end
	
	
end

endmodule : stall_logic