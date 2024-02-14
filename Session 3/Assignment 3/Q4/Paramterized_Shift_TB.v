module Paramterized_Shift_TB ();	
	parameter LOAD_AVALUE = 1;
	parameter SHIFT_DIRECTION = "LEFT" ;
	parameter LOAD_SVALUE = 1;
	parameter SHIFT_WIDTH = 8;
	reg  Sclr, Sset, shift_in, load, clock, enable, Aclr, Aset;
	reg  [SHIFT_WIDTH-1:0] Data;
	wire shift_out;
	wire [SHIFT_WIDTH-1:0] q;
	integer i = 0;

	Paramterized_Shift #(LOAD_AVALUE, SHIFT_DIRECTION, LOAD_SVALUE, SHIFT_WIDTH) DUT_Param_Shift (Sclr, Sset, shift_in, load, Data, clock, enable, Aclr, Aset, shift_out, q);

	initial begin
		clock = 0;
		forever
		#1 clock = ~clock;
	end

	initial begin
	Aset = 1;
	enable = 0;
	@(negedge clock);

	for (i=0; i<100; i=i+1) begin
		Data = $random;
		shift_in = $random;
		@(negedge clock);
	end

	Aclr = 1;
	enable = 1;
	@(negedge clock);

	for (i=0; i<200; i=i+1) begin
		Data = $random;
		shift_in = $random;
		@(negedge clock);
	end

	for (i=0; i<1000; i=i+1) begin
		Sclr = $random; 
		Sset= $random;
		shift_in = $random;
		load = $random;
		enable = $random;
		Aclr = $random;
		Aset = $random;
	  	Data = $random;
	  	@(negedge clock);
	end
		$stop;
	end
endmodule