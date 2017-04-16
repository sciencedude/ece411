import lc3b_types::*;

module datafwd
(
	input lc3b_word exe_pc,
	input lc3b_word mem_pc,
	input lc3b_word wb_pc,
	input lc3b_word in_pc,
	input lc3b_word exe_data,
	input lc3b_word mem_data,
	input lc3b_word wb_data,
	output lc3b_word fwd_data	
	
);

logic exec_out;
logic memc_out;
logic wbc_out;
logic [1:0]datamux_sel;

Compare#(16) exec
(
	.a(exe_pc),
	.b(in_pc),
	.result(exec_out)
);

Compare#(16) memc
(
	.a(mem_pc),
	.b(in_pc),
	.result(memc_out)
);

Compare#(16) wbc
(
	.a(wb_pc),
	.b(in_pc),
	.result(wbc_out)
);

always_comb
begin
	if(exec_out == 1)
	begin
		datamux_sel = 2'b00;
	end
	else if(memc_out == 1)
	begin
		datamux_sel = 2'b01;	
	end
	else if(wbc_out)
	begin
		datamux_sel = 2'b10;	
	end
	else
	begin
		datamux_sel = 2'b00;		
	end	
end


mux4#(16) datamux
(
	.sel(datamux_sel),
	.a(exe_data),
	.b(mem_data),
	.c(wb_data),
	.d(),
	.f(fwd_data)
);

endmodule : datafwd