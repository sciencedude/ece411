module magic
(
	input logic hit0,
					hit1,
					hit2,
					hit3,
					
	output logic [1:0] rdatamux_sel
);

always_comb
begin	
	if(hit1)
	rdatamux_sel = 2'b01;
	else if(hit2)
	rdatamux_sel = 2'b10;
	else if(hit3)
	rdatamux_sel = 2'b11;
	else
	rdatamux_sel = 2'b00;
end

endmodule