module shiftregister #(parameter width = 16)
(
    input clk,
    input load,
    input in,
    output logic [width-1:0] out
);

register #(width) regs
(
	.clk,
	.in({out[width-2:0], in}),
	.load,
	.out
);

endmodule : shiftregister
