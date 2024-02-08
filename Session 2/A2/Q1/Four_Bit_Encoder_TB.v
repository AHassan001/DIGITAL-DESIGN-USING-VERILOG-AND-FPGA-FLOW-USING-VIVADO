module Four_Bit_Encoder_TB();
	
	reg  [3:0]X0;
	wire [1:0]Y1,Y2;

	Four_Bit_Encoder_First_implementation Encoder_DUT (X0,Y1);

	Four_Bit_Encoder_Second_implementation Encoder_Golden (X0,Y2);

	integer i;

	initial begin
		for(i=0;i<99;i=i+1) begin 
			X0 = $random;
			#10;

			if(Y1 != Y2) begin
			$display ("Error-The 2 outputs of the 2 Encoder modules is not the same.");
			$stop;
			end
		end
		$stop;
	end
endmodule
