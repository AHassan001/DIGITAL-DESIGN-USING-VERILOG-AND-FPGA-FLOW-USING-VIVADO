module generated_conditional_construction_TB_onehot();

	reg  [2:0]A;
	wire [6:0]B;
	parameter encodeing_type = 0;

	generated_conditional_construction #(encodeing_type) encod1 (A, B);

	integer i;

	initial begin
		for(i=0;i<99;i=i+1)	begin
			A = $random;
			#10;
		end	
		$stop;
	end

	initial begin
		$monitor("A= %b, B=%b",A,B);
	end

endmodule
