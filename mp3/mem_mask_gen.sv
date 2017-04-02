import lc3b_types::*;

module mem_mask_gen
(
	input address0,
	input lc3b_word intr,
	output lc3b_mem_wmask mask

);


always_comb
begin
	if(intr[15:12] == op_stb)
		begin
			if(address0 == 1)
				begin
					mask = 2'b10;
				end
			else
				begin
					mask = 2'b01;
				end
		end
	else
		begin
			mask = 2'b11;
		end	
end

endmodule : mem_mask_gen