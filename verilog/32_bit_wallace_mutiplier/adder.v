module carry_save_adder(a,b,c,sum,carry);

    input [63:0] a,b,c;
    output [63:0] sum,carry;

    full_adder add [62:0] (a[62:0],b[62:0],c[62:0],sum[62:0],carry[63:1]);
    assign sum[63]=1'b0;
    assign carry[0]=1'b0;

endmodule

module full_adder(a,b,cin,sum,cout);

    input a,b,cin;
    output sum,cout;

    wire w1,w2,w3,w4,w5;

    xor xor_0(w1,a,b);
    xor xor_1(sum,w1,cin);
    and and_0(w2,a,b);
    and and_1(w3,a,cin);
    and and_2(w4,b,cin);
    or or_0(w5,w2,w3);
    or or_1(cout,w4,w5);

endmodule