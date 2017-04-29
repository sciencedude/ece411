module dlatch_reset (
input  wire data   , // Data Input
input  wire en     , // LatchInput
input  wire reset  , // Reset input
output reg  q        // Q output
);
always_latch
if (reset) begin
  q <= 1'b0;
end else if (en) begin
  q <= data;
end

endmodule: dlatch_reset//End Of Module dlatch_reset
