import lc3b_types::*;

module Comparator
(
		input lc3b_nzp NZP,
		input lc3b_nzp nzp,
		output branch_enable
);

assign branch_enable = (NZP[2]&nzp[2]) | (NZP[1]&nzp[1]) | (NZP[0]&nzp[0]);

endmodule : Comparator