module Sequential_Logic_Element_TB ();
	
	reg  D, CLK, EN, ALn, ADn, SLn, SD, LAT;
	wire Q;

	Sequential_Logic_Element SLE1 (D, CLK, EN, ALn, ADn, SLn, SD, LAT, Q);

	integer i = 0;

	initial begin
		CLK = 0;
		forever
			#1 CLK = ~CLK;
	end

	initial begin
		ALn = 0;
		LAT = 1;
		SLn = 1;
		@(negedge CLK);

		for (i=0; i<50; i=i+1) begin
			ADn = $random;
			D = $random;
			@(negedge CLK);
		end

		ALn = 1;
		LAT = 1;
		@(negedge CLK);

		for (i=0; i<50; i=i+1) begin
			ADn = $random;
			D = $random;
			SLn = $random;
			@(negedge CLK);
		end

		LAT = 0;
		@(negedge CLK);

		for (i=0; i<50; i=i+1) begin
			EN = $random;
			D = $random;
			SLn = $random;
			@(negedge CLK);
		end

		for (i=0; i<200; i=i+1) begin
			ALn = $random;
			LAT = $random;
			ADn = $random;
			D   = $random;
			SLn = $random;
			EN  = $random;
			@(negedge CLK);
		end
		
		$stop;
	end
endmodule