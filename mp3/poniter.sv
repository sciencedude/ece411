import lc3b_types::*;

module poniter
(
	input isI,
	input mem_resp,
	input state,
	input lc3b_word mem_adderres,
	output logic marmux_sel, loadPtr,
					loadst,
					rwmux_sel,
					read,
					write,
					stin
);


always_comb
begin
	if(isI == 1 && state == 0)
	begin
		marmux_sel = 1'b0;
		loadPtr = 1'b1;
		rwmux_sel = 1'b1;
		read = 1'b1;
		write = 1'b0;
		loadst = 1'b1;
		stin = 1'b0;
		if(mem_resp == 1)//set state to one if we get mem_resp
		begin
			stin = 1'b1;
		end
	end
	else if(isI == 1 && state == 1)
	begin
		marmux_sel = 1'b1;
		loadPtr = 1'b0;
		rwmux_sel = 1'b0;
		read = 1'b0;
		write = 1'b0;
		loadst = 1'b0;
		stin =1'b0;
		if(mem_resp == 1 || mem_adderres >= 16'hfff0)
		begin
			loadst = 1'b1; //sets state to 0 after we finshed the interstion
		end
	end
	else
	begin
		marmux_sel = 1'b0;
		loadPtr = 1'b0;
		rwmux_sel = 1'b0;
		read = 1'b0;
		write = 1'b0;
		loadst = 1'b0;
		stin =1'b0;
	end	
end

endmodule : poniter