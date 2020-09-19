`include "eight_bit_adder.v"

module sixteenbitadder(a,b,cin,sum,cout);
input [15:0] a,b;
input cin;
output [15:0] sum;
output cout;

wire c1;

eightbitadder FBA_0 (a[7:0],b[7:0],cin,sum[7:0],c1);
eightbitadder FBA_1 (a[15:8],b[15:8],c1,sum[15:8],cout);

endmodule