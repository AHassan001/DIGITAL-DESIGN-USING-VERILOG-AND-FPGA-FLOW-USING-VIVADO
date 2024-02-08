module one_to_four_demux_TB ();

	reg D, S1, S0;
	wire [3:0] OUT;
	one_to_four_demux demux01 (D, S0, S1, OUT);

	integer i;

	initial begin
		for(i=0;i<99;i=i+1) begin
			S1 = $random ;
			S0 = $random ;
			D  = $random ; 
			#10;
		end
		$stop;
	end

	initial begin
		$monitor ("S1=%d, S0=%d, D=%d, Y=%d",S1,S0,D,OUT);
	end
endmodule