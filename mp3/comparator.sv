import lc3b_types::*;

module comparator#(parameter width = 9)
(
input [width-1:0] a, b,
output logic f
);

always_comb
begin
if (a == b)
f = 1'b1;
else
f = 1'b0;
end

endmodule :comparator