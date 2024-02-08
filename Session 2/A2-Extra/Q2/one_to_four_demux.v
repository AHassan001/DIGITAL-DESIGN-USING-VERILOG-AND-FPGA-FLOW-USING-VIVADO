module one_to_four_demux (D, S0, S1, Y);

	input D, S1, S0;
	output reg [3:0]Y;

	always@(S1,S0) begin
		case ({S1,S0})
		2'b00: begin 
		 	   Y[3]=0;
		 	   Y[2]=0;
		 	   Y[1]=0;
		 	   Y[0]=D;
		 	   end
		2'b01: begin 
		 	   Y[3]=0;
		 	   Y[2]=0;
		 	   Y[1]=D;
		 	   Y[0]=0;
		 	   end
		2'b10: begin 
		 	   Y[3]=0;
		 	   Y[2]=D;
		 	   Y[1]=0;
		 	   Y[0]=0;
		 	   end
		2'b11: begin 
		 	   Y[3]=D;
		 	   Y[2]=0;
		 	   Y[1]=0;
		 	   Y[0]=0;
		 	   end
		default: Y = 0;
		endcase
	end

endmodule