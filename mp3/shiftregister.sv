module shiftregister #(parameter width = 16)
(
    input clk,
    input load,
    input in,
    output logic [width-1:0] out
);

always_ff@(posedge clk)
begin
if(load)
out = {out[width-2:0], in};
end

endmodule : shiftregister
