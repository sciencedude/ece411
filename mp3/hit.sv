import lc3b_types::*;

module hit
(
input logic a, b,
output logic f,
output logic hit
);

always_comb
begin
if (a == 1'b1)
begin
	f = 1'b0;
	hit = 1'b1;
end
else if(b == 1'b1)
begin
	f = 1'b1;
	hit = 1'b1;
end
else
begin
	hit = 1'b0;
	f = 1'b0;
end
end
endmodule :hit