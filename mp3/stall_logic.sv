import lc3b_types::*;

module stall_logic
(
	input mem_resp_i,
	input mem_resp_d,
	input mem_intr,
	input isI,
	input state,
	output logic stall
);

always_comb
begin
	if(mem_resp_i == 0 || (mem_intr == 1 && mem_resp_d == 0) ||(isI == 1 && state == 0))
		stall = 0;
	else 
		stall = 1;
end

endmodule : stall_logic