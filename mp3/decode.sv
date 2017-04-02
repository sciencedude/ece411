import lc3b_types::*;

module decode
(
	input IF_ID if_id,
	input clk,
	input lc3b_word regfile_in,
	input logic stall,
	input logic branch_enable,
	input logic load_regfile,
	input lc3b_reg dest,
	output ID_EX id_ex1
);

logic comb_sel;
lc3b_reg src_a;
lc3b_reg src_b;
logic [3:0] opcode;
ID_EX id_ex;
assign opcode = if_id.intr[15:12];

always_comb
begin
	if(if_id.intr[15:12] == op_stb | if_id.intr[15:12] == op_sti | if_id.intr[15:12] == op_str)
	comb_sel = 1'b1;
	else
	comb_sel = 1'b0;
end

mux2#(3) srcb_mux
(
	.sel(comb_sel),
	.a(if_id.intr[2:0]),
	.b(if_id.intr[11:9]),
	.f(src_b)
);

assign src_a = if_id.intr[8:6];

regfile REGFILE
(
	.clk,
	.load(load_regfile),
	.in(regfile_in),
	.src_a,
	.src_b,
	.dest,
	.reg_a(id_ex.srca_out),
	.reg_b(id_ex.srcb_out)
);


always_comb
begin
	id_ex.control_signals.srcamux_sel = 1'b0;
	id_ex.control_signals.srcbmux_sel = 3'b000;
	id_ex.control_signals.aluop = alu_add;
	id_ex.control_signals.marmux_sel = 1'b0;	//change it to zero
	id_ex.control_signals.mdr_mux_sel = 3'b000; //change it to zero
	id_ex.control_signals.cc_mux_sel = 1'b0;
	id_ex.control_signals.load_regfile = 1'b0; //change it to zero
	id_ex.control_signals.load_cc = 1'b0;
	id_ex.control_signals.mem_write = 1'b0;
	id_ex.control_signals.mem_read_d = 1'b0;
	id_ex.control_signals.isI = 1'b0;
		case(opcode)
		op_add: begin
						id_ex.control_signals.load_cc = 1'b1;
						id_ex.control_signals.load_regfile = 1'b1; 
						if(if_id.intr[5])
							id_ex.control_signals.srcbmux_sel = 3'b001;
		end
		
		op_and: begin
						id_ex.control_signals.load_cc = 1'b1;
						id_ex.control_signals.aluop = alu_and;
						id_ex.control_signals.load_regfile = 1'b1; 
						if(if_id.intr)
							id_ex.control_signals.srcbmux_sel = 3'b001;
		end
		
		op_not: begin
						id_ex.control_signals.load_cc = 1'b1;
						id_ex.control_signals.aluop = alu_not;
						id_ex.control_signals.load_regfile = 1'b1; 
		end
		
		op_ldr: begin
						id_ex.control_signals.load_cc = 1'b1;
						id_ex.control_signals.aluop = alu_add;
						id_ex.control_signals.srcamux_sel = 1'b0;
						id_ex.control_signals.srcbmux_sel = 3'b010;
						id_ex.control_signals.mdr_mux_sel = 3'b001;
						id_ex.control_signals.load_regfile = 1'b1;
						id_ex.control_signals.cc_mux_sel = 2'b01;
						id_ex.control_signals.mem_read_d = 1'b1;
					end
					
		op_str: begin
						id_ex.control_signals.aluop = alu_add;
						id_ex.control_signals.srcamux_sel = 1'b0;
						id_ex.control_signals.srcbmux_sel = 3'b010;
						id_ex.control_signals.mdr_mux_sel = 3'b010; //add this so mdr has sr register to write to scp
						id_ex.control_signals.mem_write = 1'b1;
						//id_ex.control_signals.mem_read_d = 1'b1; dont't want to read and write just write
					end
					
		op_br: begin
						id_ex.control_signals.aluop = alu_add;
						id_ex.control_signals.srcamux_sel = 1'b1;
						id_ex.control_signals.srcbmux_sel = 2'b011; //this need to calculate
		end
		op_lea: begin
		                id_ex.control_signals.aluop = alu_add;
						id_ex.control_signals.srcamux_sel = 1'b1;
						id_ex.control_signals.srcbmux_sel = 2'b011;
						id_ex.control_signals.load_cc = 1'b1;
						id_ex.control_signals.load_regfile = 1'b1; 
		end
		op_stb : begin
						id_ex.control_signals.aluop = alu_add;
						id_ex.control_signals.srcamux_sel = 1'b0;
						id_ex.control_signals.srcbmux_sel = 2'b011; //SEXT(offset6)] with no left shift
						id_ex.control_signals.mdr_mux_sel = 2'b11; //add this so mdr has sr register to write to scp
						id_ex.control_signals.mem_write = 1'b1;
		end
	    op_ldb :begin	       
						id_ex.control_signals.load_cc = 1'b1;
						id_ex.control_signals.aluop = alu_add;
						id_ex.control_signals.srcamux_sel = 1'b0;
						id_ex.control_signals.srcbmux_sel = 2'b011;//SEXT(offset6)] with no left shift
						id_ex.control_signals.mdr_mux_sel = 2'b100;
						id_ex.control_signals.load_regfile = 1'b1;
						id_ex.control_signals.cc_mux_sel = 2'b01;
						id_ex.control_signals.mem_read_d = 1'b1;	    
	    end
		op_sti : begin
						id_ex.control_signals.aluop = alu_add;
						id_ex.control_signals.srcamux_sel = 1'b0;
						id_ex.control_signals.srcbmux_sel = 2'b10; 
						id_ex.control_signals.mdr_mux_sel = 2'b010; //add this so mdr has sr register to write to scp
						id_ex.control_signals.mem_write = 1'b1;
						id_ex.control_signals.isI = 1'b1;
		end
	    op_ldi :begin       
						id_ex.control_signals.load_cc = 1'b1;
						id_ex.control_signals.aluop = alu_add;
						id_ex.control_signals.srcamux_sel = 1'b0;
						id_ex.control_signals.srcbmux_sel = 2'b10;
						id_ex.control_signals.mdr_mux_sel = 2'b001;
						id_ex.control_signals.load_regfile = 1'b1;
						id_ex.control_signals.cc_mux_sel = 2'b01;
						id_ex.control_signals.mem_read_d = 1'b1;	  
						id_ex.control_signals.isI = 1'b1;
	    end	    
	endcase
				
						
end

assign id_ex.pc_out = if_id.pc_out;
assign id_ex.intr = if_id.intr;

register#($bits(id_ex)) id_Ex
(
	.clk,
	.in(id_ex),
	.out(id_ex1),
	.load(stall)
);

endmodule


	