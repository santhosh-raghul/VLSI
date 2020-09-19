`include "sixteen_bit_adder.v"

module thirtytwobitadder(a,b,cin,sum,cout);
input [31:0] a,b;
input cin;
output [31:0] sum;
output cout;

wire c1;

sixteenbitadder FBA_0 (a[15:0],b[15:0],cin,sum[15:0],c1);
sixteenbitadder FBA_1 (a[31:16],b[31:16],c1,sum[31:16],cout);

endmodule