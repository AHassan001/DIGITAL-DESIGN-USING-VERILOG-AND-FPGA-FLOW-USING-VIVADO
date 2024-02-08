module one_bit_ALU (A, B, A_INV, B_INV, Carry_IN, Operation, Carry_Out, Result);

	input A, B, A_INV, B_INV, Carry_IN;
	input[1:0] Operation;
	output Carry_Out, Result; 

	wire A_MUX_out, B_MUX_out, AND_out, OR_out, Adder_out;

	assign A_MUX_out = (A_INV==0) ? A : ~A ;
	assign B_MUX_out = (B_INV==0) ? B : ~B ;

	assign AND_out = A_MUX_out & B_MUX_out;
	assign OR_out  = A_MUX_out | B_MUX_out;

	assign {Carry_Out, Adder_out} = A_MUX_out + B_MUX_out + Carry_IN;

	assign Result = (Operation==0) ? AND_out : (Operation==1) ? OR_out : Adder_out ;

endmodule