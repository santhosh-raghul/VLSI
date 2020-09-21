`include"adder.v"
`include"../32_bit_adder_recursive_doubling/fast_adder.v"

module multiplier(a,b,product,carry_out);

    input [31:0] a, b;
    output [63:0] product;
    output carry_out;

    wire [63:0]level_1[31:0];
    wire [63:0]level_2[21:0];
    wire [63:0]level_3[14:0];
    wire [63:0]level_4[9:0];
    wire [63:0]level_5[6:0];
    wire [63:0]level_6[4:0];
    wire [63:0]level_7[3:0];
    wire [63:0]level_8[2:0];
    wire [63:0]level_9[1:0];
    wire middle_carry;

    genvar i,k;
    integer j;
    generate
        for(i=0;i<32;i=i+1)
        begin
            for(k=0;k<i;k=k+1)
                assign level_1[i][k]=0;
            for(k=i;k-i<32;k=k+1)
                assign level_1[i][k]=a[k-i]&&b[i];
            for(k=32+i;k<64;k=k+1)
                assign level_1[i][k]=0;
        end
    endgenerate

    generate
        for(i=0;i<=27;i=i+3)
            carry_save_adder calc_level_2 (level_1[i],level_1[i+1],level_1[i+2],level_2[i*2/3],level_2[i*2/3+1]);
    endgenerate
    assign level_2[20]=level_1[30];
    assign level_2[21]=level_1[31];

    generate
        for(i=0;i<=18;i=i+3)
            carry_save_adder calc_level_3 (level_2[i],level_2[i+1],level_2[i+2],level_3[i*2/3],level_3[i*2/3+1]);
    endgenerate
    assign level_3[14]=level_2[21];

    generate
        for(i=0;i<=12;i=i+3)
            carry_save_adder calc_level_4 (level_3[i],level_3[i+1],level_3[i+2],level_4[i*2/3],level_4[i*2/3+1]);
    endgenerate

    generate
        for(i=0;i<=6;i=i+3)
            carry_save_adder calc_level_5 (level_4[i],level_4[i+1],level_4[i+2],level_5[i*2/3],level_5[i*2/3+1]);
    endgenerate
    assign level_5[6]=level_4[9];

    generate
        for(i=0;i<=3;i=i+3)
            carry_save_adder calc_level_6 (level_5[i],level_5[i+1],level_5[i+2],level_6[i*2/3],level_6[i*2/3+1]);
    endgenerate
    assign level_6[4]=level_5[6];
    
    carry_save_adder calc_level_7 (level_6[0],level_6[1],level_6[2],level_7[0],level_7[1]);
    assign level_7[2]=level_6[3];
    assign level_7[3]=level_6[4];

    carry_save_adder calc_level_8 (level_7[0],level_7[1],level_7[2],level_8[0],level_8[1]);
    assign level_8[2]=level_7[3];

    carry_save_adder calc_level_9 (level_8[0],level_8[1],level_8[2],level_9[0],level_9[1]);

    adder32bit bit_0_to_31 (level_9[0][31:0],level_9[1][31:0],1'b0,product[31:0],middle_carry);
    adder32bit bit_32_to_63 (level_9[0][63:32],level_9[1][63:32],1'b0,product[63:32],carry_out);

endmodule
