`include "fulladder.v"

module top;
reg a,b,cin;
wire sum,cout;

fulladder FullAdd_0 (a,b,cin,sum,cout);

initial
begin
    a=0;b=0;cin=0;
	#10 b=1;
	#10 a=1;b=0;
	#10 b=1;
    #10 a=0;b=0;cin=1;
    #10 b=1;
	#10 a=1;b=0;
	#10 b=1;
    #10;
end

initial

begin
    $monitor($time,"  a = %b, b = %b, cin = %b sum = %b, cout = %b",a,b,cin,sum,cout);
    $dumpfile("fulladder.vcd");
	$dumpvars;
end

endmodule