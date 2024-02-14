module Four_Bit_Ripple_Counter_TB ();
	reg CLK, RSTn;
	wire [3:0]Out;

	Four_Bit_Ripple_Counter R_Counter (CLK, RSTn, Out);

	initial begin
		CLK = 0;
		forever
			#1 CLK = ~CLK;
	end
 
	initial begin
		RSTn = 0;
		@(negedge CLK);

		RSTn = 1;
		repeat(50)	@(negedge CLK);
		$stop;
	end


endmodule