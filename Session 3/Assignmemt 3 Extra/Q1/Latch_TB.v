module Latch_TB ();
	
	parameter LAT_WIDTH = 4;
	reg  Aset, gate, Aclr;
	reg  [LAT_WIDTH-1:0] data;
	wire [LAT_WIDTH-1:0] q;
	integer i =0;

	Latch #(LAT_WIDTH) DUT_Latch (Aset, data, gate, Aclr, q);

	initial begin
		Aclr = 1;
		Aset = 1;
		for (i=0; i<20; i=i+1) begin
			data = $random;
			gate = $random;
			#10;
		end

		Aclr = 1;
		Aset = 0;
		for (i=0; i<20; i=i+1) begin
			data = $random;
			gate = $random;
			#10;
		end

		Aclr = 0;
		Aset = 1;
		for (i=0; i<20; i=i+1) begin
			data = $random;
			gate = $random;
			#10;
		end

		Aclr = 0;
		Aset = 0;
		for (i=0; i<20; i=i+1) begin
			data = $random;
			gate = $random;
			#10;
		end

		for (i=0; i<50; i=i+1) begin
			Aclr = $random;
			Aset = $random;
			gate = $random;
			data = $random;
			#10;
		end
		$stop;
	end

endmodule