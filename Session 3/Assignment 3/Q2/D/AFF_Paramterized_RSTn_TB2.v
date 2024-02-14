module AFF_Paramterized_RSTn_TB2 ();

	parameter Type = "TFF";

	reg  D, RSTn, CLK;
	wire Q, Q_Bar;

    AFF_Paramterized_RSTn #(Type) DUT2_TFF (D, RSTn, CLK, Q, Q_Bar);

    integer i = 0;

    initial begin 
    	CLK =0;
    	forever 
			#1 CLK = ~CLK;
    end

    initial begin
    	RSTn = 0;
    	for (i=0;i<50;i=i+1) begin
    		D = $random;
    		@(negedge CLK);
    	end

    	RSTn = 1;
    	for (i=0;i<100;i=i+1) begin
    		D = $random;
    		@(negedge CLK);
    	end

    	for (i=0;i<100;i=i+1) begin
    	    RSTn = $random;
    		D = $random;
    		@(negedge CLK);
    	end
    	$stop;
    end

endmodule

