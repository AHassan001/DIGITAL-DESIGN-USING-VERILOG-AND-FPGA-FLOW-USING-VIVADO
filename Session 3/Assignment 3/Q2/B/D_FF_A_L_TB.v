module D_FF_A_L_TB ();
	reg  D, RSTn, CLK;
	wire Q, Q_bar;

	D_FF_A_L D_flipflop (D, RSTn, CLK, Q, Q_bar);

	integer i = 0;

	initial begin
		CLK = 0;
		forever
		  #1 CLK = ~CLK;
	end

	initial begin
		$monitor("RSTn=%b, D=%b, Q=%b, Q_bar=%b",RSTn, D, Q, Q_bar);
		RSTn = 0;
		@(negedge CLK);

		for(i=0; i<50;i=i+1)begin
			D = 0;
			@(negedge CLK);
		end

		for(i=0; i<50;i=i+1)begin
			D = 1;
			@(negedge CLK);
		end

		RSTn = 1;
		for(i=0; i<100;i=i+1)begin
			D = 0;
			@(negedge CLK);
		end

		for(i=0; i<100;i=i+1)begin
			D = 1;
			@(negedge CLK);
		end

		for(i=0; i<200;i=i+1)begin
			D = $random;
			RSTn = $random;
			@(negedge CLK);
		end
		$stop;
	end
endmodule