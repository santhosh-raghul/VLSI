`include"16_bit_han_carlson_adder.v"

module top;

	reg [15:0] a,b;

	wire [15:0]sum;
	wire cout;

	han_carlson_adder add (a,b,sum,cout);

	initial
	begin
		a=16'd10;b=16'd10;
		#5 a=16'd200;
		#5 b=16'd750;
		#5 a=16'd1234;
		#5 b=16'd5678;
		#5;
	end

	initial
	begin
		$monitor($time,"  a = %d, b = %d, sum = %d, cout = %d",a,b,sum,cout);
		$dumpfile("waveform.vcd");
		$dumpvars;
	end

endmodule