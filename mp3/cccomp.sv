module cccomp
(
	input N,Z,P,
	input n,z,p, 
	output logic out
);

always_comb
begin
	if((n && N)||(z && Z)||(p && P))
		out = 1'b1;
	else
		out = 1'b0;
end

endmodule : cccomp