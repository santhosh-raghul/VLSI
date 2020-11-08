`include "dadda.v"

module top;

	reg [15:0] a,b;
	wire [31:0]product;
	reg [31:0]pd;

	dadda mult (a,b,product);

	always @*
		pd=a*b;

	initial
	begin
		$dumpfile("dadda.vcd");
		$dumpvars;
		$monitor("%t   dadda: %d    multiplication: %d",$time,product,pd);
		a=16'd285;b=16'd988;
		#5 a=16'd1642;b=16'd1654;
		#5 a=16'hff;b=16'haa;
		#5 a=16'd187;b=16'd842;
		#5 a=16'd0;b=16'd6567;
	end

endmodule