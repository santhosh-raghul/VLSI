`include "four_bit_adder.v"

module top;
reg [3:0] a,b;
reg cin;
wire [3:0]sum;
wire cout;

fourbitadder add (a,b,cin,sum,cout);

initial
begin
    cin=1'b0;
    #5 a=4'd10;
    #5 b=4'd10;
    #5 a=4'b1111;
    #5 b=4'b1111;
end

initial

    $monitor($time,"  a = %b, b = %b, cin = %b sum = %b, cout = %b",a,b,cin,sum,cout);

endmodule