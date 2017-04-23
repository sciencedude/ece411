import lc3b_types::*;

module fetch
(
	input lc3b_word intr,
	input logic clk,
	input lc3b_word alu_out,
	input mem_resp_i,
	input stall,
	input branch_enable,
	input [1:0] pcmux_sel,
	input lc3b_word mem_wdata,
	input lc3b_word wb_pc,
	input lc3b_word br_count_out,
	output lc3b_word br_count_in,
	output lc3b_word address,
	output logic mem_read_i,
	output IF_ID if_id
);


lc3b_word add_out;
lc3b_word pc_in;
lc3b_word pc_out;
lc3b_word branchmux_out;
lc3b_word adj9_out;
lc3b_word bradder_out;
logic branchmux_sel;


plus2 add
(
	.in(pc_out), //program would branch only for one intr the countie like it didn't branch changed to pc_out scp
	.out(add_out)
);

mux2 branchmux
(
	.sel(branchmux_sel),
	.a(add_out),
	.b(bradder_out),
	.f(branchmux_out)
);

mux4 pc_mux
(
	.sel(pcmux_sel),
	.a(branchmux_out),
	.b(alu_out),
	.c(mem_wdata),
	.d(wb_pc),
	.f(pc_in)
);

adj #(.width(9)) adj9
(
	.in(intr[8:0]),
	.out(adj9_out)
);

adder bradder
(
	.a(add_out),
	.b(adj9_out),
	.f(bradder_out)
);

register #(.width(16)) pc
(
	.clk,
	.load(stall),
	.in(pc_in),
	.out(pc_out)
);

register #($bits(IF_ID)) IF_ID_OUT
(
	.clk,
	.load(stall),
	.in({intr,add_out,branchmux_sel}),
	.out(if_id)
);

always_comb
begin
branchmux_sel = 1'b0;
br_count_in = br_count_out;

	case(intr[15:12])
	op_br:begin
		if(intr[11] == 1 || intr[10] == 1 || intr[9] == 1)
		begin
			branchmux_sel = 1'b1; //branch taken predited
			br_count_in = br_count_out+1;
		end
	end
	op_jmp : begin
	
	end
	op_jsr : begin
	
	end
	op_trap : begin 
	
	end
	default:begin
	
	end
	endcase

end


assign mem_read_i = stall;
//assign if_id.intr = intr;
assign address = pc_out;

endmodule
	