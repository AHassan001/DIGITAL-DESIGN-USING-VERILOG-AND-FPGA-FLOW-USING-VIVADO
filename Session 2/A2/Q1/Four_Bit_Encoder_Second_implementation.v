module Four_Bit_Encoder_Second_implementation (In,Out);
	input      [3:0] In;
	output reg [1:0] Out;

	always@(In) begin
		if(In[3] == 1)
			Out = 2'b11;
		else if(In[2] == 1)
			Out = 2'b10;
		else if(In[1] == 1)
			Out = 2'b01;
		else 
			Out = 2'b00;
	end
endmodule