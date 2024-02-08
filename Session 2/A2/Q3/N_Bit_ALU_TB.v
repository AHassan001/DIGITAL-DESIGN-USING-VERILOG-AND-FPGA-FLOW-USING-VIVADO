module N_Bit_ALU_TB();
	
	reg  [3:0] A, B;
	reg  [1:0] OP_Code;
	wire [3:0] Result;

	N_bit_ALU #(4) ALU1 (A, B, OP_Code, Result);

	integer i;

	initial begin
		for(i=0;i<99;i=i+1) begin
			OP_Code = $random;
			A = $random;
			B = $random;
			#10;
		end
		$stop;
	end

	initial begin
		$monitor ("OPcode= %d, A= %d, B= %d, Result= %d",OP_Code, A, B, Result);
	end

endmodule

