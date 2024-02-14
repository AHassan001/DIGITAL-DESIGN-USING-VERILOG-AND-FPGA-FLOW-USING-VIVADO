module four_Bit_counter_Beh_extra_2_outputs_TB ();
	reg  clk, set;
	wire [3:0] out;
	wire Div_2, Div_4;

 	four_Bit_counter_Beh_extra_2_outputs DUT_Counter (clk, set, out, Div_2, Div_4);

	initial begin
		clk = 0;
		forever
			#1 clk = ~clk;
	end 

	initial begin
		set = 1;
		#10;
		set = 0;
		repeat(100) @(negedge clk); 
		$stop;
	end 

endmodule