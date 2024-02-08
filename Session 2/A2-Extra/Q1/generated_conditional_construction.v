module generated_conditional_construction(A, B);

	parameter Use_Gray; // if USE_Gray == 1 preform gray encoding else preform one-hot encoding
	input  [2:0]A;
	output reg [6:0]B;

	always@(A) begin
		if(Use_Gray)begin
			case(A)
				0: B = 7'b000;
				1: B = 7'b001;
				2: B = 7'b011;
				3: B = 7'b010;
				4: B = 7'b110;
				5: B = 7'b111;
				6: B = 7'b101;
				7: B = 7'b100;
				default:B = 0;
			endcase
		end

		else begin 
			case(A)
				0: B = 7'b0000000;
				1: B = 7'b0000001;
				2: B = 7'b0000010;
				3: B = 7'b0000100;
				4: B = 7'b0001000;
				5: B = 7'b0010000;
				6: B = 7'b0100000;
				7: B = 7'b1000000;
				default:B = 0;
			endcase
		end
	end 
endmodule