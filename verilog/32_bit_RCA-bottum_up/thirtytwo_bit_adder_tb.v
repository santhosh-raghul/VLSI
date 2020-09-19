`include "thirtytwo_bit_adder.v"

module top;
reg [31:0] a,b;
reg cin;
wire [31:0]sum;
wire cout;

thirtytwobitadder add (a,b,cin,sum,cout);

initial
begin
    cin=1'b0;a=32'd10;b=32'd10;
    #5 a=32'd200;
    #5 b=32'd750;
    #5 a=32'd1234;
    #5 b=32'd5678;
    #5;
end

initial

begin
    $monitor($time,"  a = %d, b = %d, cin = %d sum = %d, cout = %d",a,b,cin,sum,cout);
    $dumpfile("thirtytwo_bit_adder.vcd");
	$dumpvars;
end

endmodule
