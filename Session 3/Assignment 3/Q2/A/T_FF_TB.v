module T_FF_TB ();

	reg  T, RSTn, CLK;
	wire Q, Q_bar;

	T_FF T_flipflop (T, RSTn, CLK, Q, Q_bar);

	integer i = 0;

	initial begin
		CLK = 0;
		forever
		  #1 CLK = ~CLK;
	end

	initial begin
		$monitor("RSTn=%b, T=%b, Q=%b, Q_bar=%b",RSTn, T, Q, Q_bar);
		RSTn = 1;
		@(negedge CLK);

		for(i=0; i<50;i=i+1)begin
			T = 0;
			@(negedge CLK);
		end

		for(i=0; i<50;i=i+1)begin
			T = 1;
			@(negedge CLK);
		end

		RSTn = 0;
		for(i=0; i<100;i=i+1)begin
			T = 0;
			@(negedge CLK);
		end

		for(i=0; i<100;i=i+1)begin
			T = 1;
			@(negedge CLK);
		end

		for(i=0; i<200;i=i+1)begin
			T = $random;
			RSTn = $random;
			@(negedge CLK);
		end
		$stop;
	end
endmodule