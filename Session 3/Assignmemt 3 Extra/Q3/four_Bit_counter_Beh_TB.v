module four_Bit_counter_Beh_TB();

	reg  clk, set, RSTn;
	wire [3:0] out, Out_Golden;

	integer i = 0;

	four_Bit_counter_Beh DUT(clk, set, out);

	Four_Bit_Ripple_Counter Golden (clk, RSTn, Out_Golden);

	initial begin
		clk = 0;
		forever
			#1 clk = ~clk;
	end

	initial begin
		set = 1;
		RSTn = 0;
		#10;

		set  = 0;
		RSTn = 1;
		#10;

		for(i=0; i<200; i=i+1) begin
			
			#10;
			if(out != Out_Golden) begin
				$display("Error the 2 values is not the same.");
				$stop;
			end
		end
		$stop;
	end

endmodule

