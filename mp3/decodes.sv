import lc3b_types::*; /* Import types defined in lc3b_types.sv */

module decodes
(
input lc3b_c_index offset,
input [127:0] a,
output logic [15:0] f
);
always_comb
begin
case(offset)
	3'b000:begin
	f = a[15:0];
	end
	3'b001:begin
	f = a[31:16];
	end
	3'b010:begin
	f = a[47:32];
	end
	3'b011:begin
	f = a[63:48];
	end
	3'b100:begin
	f = a[79:64];
	end
	3'b101:begin
	f = a[95:80];
	end
	3'b110:begin
	f = a[111:96];
	end
	3'b111:begin
	f = a[127:112];
	end
	default:begin
	f = a[15:0];
	end
endcase
end
endmodule : decodes