import lc3b_types::*;

module wb_stage
(
	input clk, 	
	input MEM_WB mem_wb,
	input lc3b_word brmiss_count_out,
	output lc3b_word brmiss_count_in,
	output lc3b_reg dest,
	output logic load_regfile,
	output lc3b_word regfile_in,
	output logic[1:0] pcmux_sel,
	output logic destmux_sel,
	output lc3b_word new_pc,
	output lc3b_word wb_pc,
	output lc3b_word wb_data,
	output logic [3:0] mem_wb_destreg,
	output logic flush ,
	output logic brhistory_in,
	output logic brhistory_load,
	output logic [1:0] bht_in,
	input logic [1:0] bht_out
	
);

lc3b_nzp gencc_out;
lc3b_nzp cc_out;
logic branch_enable_out;
assign new_pc = mem_wb.mem_data;
mux4 cc_mux
(
	.sel(mem_wb.control_signals.cc_mux_sel),
	.a(mem_wb.alu_out),
	.b(mem_wb.mem_data),
	.c(mem_wb.pc_out),
	.d(16'h00),
	.f(regfile_in)
);

gencc gencc1
(
	.in(regfile_in),
	.out(gencc_out)
);

register #(.width(3)) cc
(
	.clk,
	.load(mem_wb.control_signals.load_cc),
	.in(gencc_out),
	.out(cc_out)
);


always_comb
begin
	flush = 1'b0;
	pcmux_sel = mem_wb.control_signals.pcmux_sel;
	brmiss_count_in = brmiss_count_out;
	brhistory_load = 1'b0;
	wb_pc = mem_wb.pc_out;
	bht_in = 2'b00;
	case(bht_out)
		2'b00:begin
		if(branch_enable_out == 1)
			begin
				bht_in = 2'b00;
			end
		else
			begin
				bht_in = 2'b01;
			end
		end
		2'b01:begin
		if(branch_enable_out == 1)
			begin
				bht_in = 2'b00;
			end
		else
			begin
				bht_in = 2'b10;
			end
		end
		2'b10:begin
		if(branch_enable_out == 1)
			begin
				bht_in = 2'b01;
			end
		else
			begin
				bht_in = 2'b11;
			end
		end
		2'b11:begin
		if(branch_enable_out == 1)
			begin
				bht_in = 2'b10;
			end
		else
			begin
				bht_in = 2'b11;
			end
		end
		endcase
	case(mem_wb.intr[15:12])
	op_br:begin
		if(mem_wb.intr[11] == 1 || mem_wb.intr[10] == 1 || mem_wb.intr[9] == 1)
			begin
				brhistory_load = 1'b1;
			if(branch_enable_out != mem_wb.brpredict) //make sure it's not a nop
				begin
				flush = 1'b1;
				pcmux_sel = 2'b11;
				brmiss_count_in = brmiss_count_out+1;
				brhistory_load = 1'b1;
				if(mem_wb.brpredict == 1)
					begin
						wb_pc = mem_wb.pc_out;
					end
				else
					begin
						wb_pc = mem_wb.alu_out;
					end
			end
		end	
	end
	op_jmp : begin
		flush = 1'b1;
	end
	op_jsr : begin
		flush = 1'b1;
	end
	op_trap : begin 
		flush = 1'b1;
	end
	default:begin
	
	end
	endcase

end


cccomp cccomp1
(
	.N(mem_wb.intr[11]),
	.Z(mem_wb.intr[10]),
	.P(mem_wb.intr[9]),
	.n(cc_out[2]),
	.z(cc_out[1]),
	.p(cc_out[0]),
	.out(branch_enable_out) //this is temp fix other branch still happen even tho not a branch intr
);


assign load_regfile = mem_wb.control_signals.load_regfile;
assign dest = mem_wb.intr[11:9];
assign destmux_sel = mem_wb.control_signals.destmux_sel;
//assign wb_data = mem_wb.alu_out;
assign wb_data = regfile_in;
assign mem_wb_destreg = mem_wb.destreg;
assign brhistory_in = branch_enable_out;
endmodule : wb_stage