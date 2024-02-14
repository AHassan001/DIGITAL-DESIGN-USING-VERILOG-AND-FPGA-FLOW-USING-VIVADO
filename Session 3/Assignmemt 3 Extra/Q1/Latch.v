module Latch (Aset, data, gate, Aclr, q);
	
	parameter LAT_WIDTH = 4;

	input  Aset, gate, Aclr;
	input  [LAT_WIDTH-1:0] data;

	output reg [LAT_WIDTH-1:0] q;

	always @(*) begin
		if(Aclr)
			q <= 0;
		else if(Aset)
			q <= ~0;
		else if (gate)
			q <= data;
	end
endmodule