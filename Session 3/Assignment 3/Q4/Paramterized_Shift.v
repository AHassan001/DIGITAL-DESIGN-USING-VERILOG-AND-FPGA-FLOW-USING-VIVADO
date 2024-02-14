module Paramterized_Shift (Sclr, Sset, shift_in, load, Data, clock, enable, Aclr, Aset, shift_out, q);
	
	parameter LOAD_AVALUE = 1;
	parameter SHIFT_DIRECTION = "LEFT" ;
	parameter LOAD_SVALUE = 1;
	parameter SHIFT_WIDTH = 8;
	
	input  Sclr, Sset, shift_in, load, clock, enable, Aclr, Aset;
	input  [SHIFT_WIDTH-1:0]Data;

	output reg shift_out;
	output reg [SHIFT_WIDTH-1:0] q;

	always @(posedge clock or posedge Aclr or posedge Aset) begin
		
		if(Aclr)
			q <= 0;
		else if(Aset)
			q <=  LOAD_AVALUE;
		else if(enable)begin
			if(Sclr)
				q <= 0;
			else if (Sset)
				q <=  LOAD_SVALUE;
			else if (load)
				q <= Data;
			else begin
				if(SHIFT_DIRECTION == "LEFT") begin
					shift_out <= Data[7];
					q <= {Data[6:0],shift_in}; 
				end
				else begin
					shift_out <= Data[0];
					q <= {shift_in, Data[7:1]};
				end

			end
		end

	end

endmodule