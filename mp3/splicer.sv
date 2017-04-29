import lc3b_types::*; /* Import types defined in lc3b_types.sv */

module splicer
(
	input lc3b_c_index offset,
	input logic[127:0] a,
	input logic[15:0] b,
	input lc3b_mem_wmask byte_enable,
	output logic[127:0] f
);

always_comb
begin
case(offset)
	3'b000:begin
		case(byte_enable)
			2'b11:begin
				f = {a[127:16],b[15:0]};
			end
			2'b10:begin
				f = {a[127:16],b[15:8],a[7:0]};
			end
			2'b01:begin
				f = {a[127:8],b[7:0]};
			end
			default: begin
				f = a;
			end
		endcase
	end
	3'b001:begin
		case(byte_enable)
			2'b11:begin
				f = {a[127:32],b[15:0],a[15:0]};
			end
			2'b10:begin
				f = {a[127:32],b[15:8],a[23:0]};
			end
			2'b01:begin
				f = {a[127:24],b[7:0],a[15:0]};
			end
			default: begin
				f = a;
			end
		endcase
	end
	3'b010:begin
		case(byte_enable)
			2'b11:begin
				f = {a[127:48],b[15:0],a[31:0]};
			end
			2'b10:begin
				f = {a[127:48],b[15:8],a[39:0]};
			end
			2'b01:begin
				f = {a[127:40],b[7:0],a[31:0]};
			end
			default: begin
				f = a;
			end
		endcase
	end
	3'b011:begin
		case(byte_enable)
			2'b11:begin
				f = {a[127:64],b[15:0],a[47:0]};
			end
			2'b10:begin
				f = {a[127:64],b[15:8],a[55:0]};
			end
			2'b01:begin
				f = {a[127:56],b[7:0],a[47:0]};
			end
			default: begin
				f = a;
			end
		endcase
	end
	3'b100:begin
		case(byte_enable)
			2'b11:begin
				f = {a[127:80],b[15:0],a[63:0]};
			end
			2'b10:begin
				f = {a[127:80],b[15:8],a[71:0]};
			end
			2'b01:begin
				f = {a[127:72],b[7:0],a[63:0]};
			end
			default: begin
				f = a;
			end
		endcase
	end
	3'b101:begin
		case(byte_enable)
			2'b11:begin
				f = {a[127:96],b[15:0],a[79:0]};
			end
			2'b10:begin
				f = {a[127:96],b[15:8],a[87:0]};
			end
			2'b01:begin
				f = {a[127:88],b[7:0],a[79:0]};
			end
			default: begin
				f = a;
			end
		endcase
	end
	3'b110:begin
		case(byte_enable)
			2'b11:begin
				f = {a[127:112],b[15:0],a[95:0]};
			end
			2'b10:begin
				f = {a[127:112],b[15:8],a[103:0]};
			end
			2'b01:begin
				f = {a[127:104],b[7:0],a[95:0]};
			end
			default: begin
				f = a;
			end
		endcase
	end
	3'b111:begin
		case(byte_enable)
			2'b11:begin
				f = {b[15:0],a[111:0]};
			end
			2'b10:begin
				f = {b[15:8],a[119:0]};
			end
			2'b01:begin
				f = {a[127:120],b[7:0],a[111:0]};
			end
			default: begin
				f = a;
			end
		endcase
	end
	default:begin
	f = a;
	end
endcase
end


endmodule : splicer