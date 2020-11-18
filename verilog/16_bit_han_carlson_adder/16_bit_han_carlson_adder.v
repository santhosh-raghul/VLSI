module han_carlson_adder(a,b,sum,cout);

	input [15:0] a,b;
	output [15:0] sum;
	output cout;

	wire [15:0] p,g,c;

	genvar i;
	generate
		for(i=0;i<=15;i=i+1)
			get_pg p_g(a[i],b[i],p[i],g[i]);
	endgenerate

	han_carlson_levels c_gen(p,g,c);

	assign sum[0]=p[0];
	generate
		for(i=1;i<=15;i=i+1)
			assign sum[i]=p[i]^c[i-1];
	endgenerate
	assign cout=c[15];

endmodule

module  han_carlson_levels(p,g,c);

	input [15:0] p,g;
	output [15:0] c;

	// begin
	pg_from_two_levels b11(p[15],g[15],p[14],g[14],p15_14,g15_14);
	pg_from_two_levels b12(p[13],g[13],p[12],g[12],p13_12,g13_12);
	pg_from_two_levels b13(p[11],g[11],p[10],g[10],p11_10,g11_10);
	pg_from_two_levels b14(p[9],g[9],p[8],g[8],p9_8,g9_8);
	pg_from_two_levels b15(p[7],g[7],p[6],g[6],p7_6,g7_6);
	pg_from_two_levels b16(p[5],g[5],p[4],g[4],p5_4,g5_4);
	pg_from_two_levels b17(p[3],g[3],p[2],g[2],p3_2,g3_2);
	g_from_one_level g11(p[1],g[1],g[0],g1_0);
	assign c[1]=g1_0;
	assign p0_0=p[0];
	assign g0_0=g[0];
	assign p2_2=p[2];
	assign g2_2=g[2];
	assign p4_4=p[4];
	assign g4_4=g[4];
	assign p6_6=p[6];
	assign g6_6=g[6];
	assign p8_8=p[8];
	assign g8_8=g[8];
	assign p10_10=p[10];
	assign g10_10=g[10];
	assign p12_12=p[12];
	assign g12_12=g[12];
	assign p14_14=p[14];
	assign g14_14=g[14];

	// level 2
	pg_from_two_levels b21(p15_14,g15_14,p13_12,g13_12,p15_12,g15_12);
	pg_from_two_levels b22(p13_12,g13_12,p11_10,g11_10,p13_10,g13_10);
	pg_from_two_levels b23(p11_10,g11_10,p9_8,g9_8,p11_8,g11_8);
	pg_from_two_levels b24(p9_8,g9_8,p7_6,g7_6,p9_6,g9_6);
	pg_from_two_levels b25(p7_6,g7_6,p5_4,g5_4,p7_4,g7_4);
	pg_from_two_levels b26(p5_4,g5_4,p3_2,g3_2,p5_2,g5_2);
	g_from_one_level g21(p3_2,g3_2,g1_0,g3_0);
	assign c[3]=g3_0;

	// level 3
	pg_from_two_levels b31(p15_12,g15_12,p11_8,g11_8,p15_8,g15_8);
	pg_from_two_levels b32(p13_10,g13_10,p9_6,g9_6,p13_6,g13_6);
	pg_from_two_levels b33(p11_8,g11_8,p7_4,g7_4,p11_4,g11_4);
	pg_from_two_levels b34(p9_6,g9_6,p5_2,g5_2,p9_2,g9_2);
	g_from_one_level g31(p7_4,g7_4,g3_0,g7_0);
	assign c[7]=g7_0;
	g_from_one_level g32(p5_2,g5_2,g1_0,g5_0);
	assign c[5]=g5_0;

	// level 4
	g_from_one_level g41(p15_8,g15_8,g7_0,g15_0);
	assign c[15]=g15_0;
	g_from_one_level g42(p13_6,g13_6,g5_0,g13_0);
	assign c[13]=g13_0;
	g_from_one_level g43(p11_4,g11_4,g3_0,g11_0);
	assign c[11]=g11_0;
	g_from_one_level g44(p9_2,g9_2,g1_0,g9_0);
	assign c[9]=g9_0;

	// level 5
	g_from_one_level g51(p2_2,g2_2,g1_0,c[2]);
	g_from_one_level g52(p4_4,g4_4,g3_0,c[4]);
	g_from_one_level g53(p6_6,g6_6,g5_0,c[6]);
	g_from_one_level g54(p8_8,g8_8,g7_0,c[8]);
	g_from_one_level g55(p10_10,g10_10,g9_0,c[10]);
	g_from_one_level g56(p12_12,g12_12,g11_0,c[12]);
	g_from_one_level g57(p14_14,g14_14,g13_0,c[14]);
	assign c[0]=g0_0;

endmodule

module get_pg(a,b,p,g);

	input a,b;
	output p,g;

	xor (p,a,b);
	and (g,a,b);

endmodule

module g_from_one_level(p1,g1,g2,g);

	input p1,g1,g2;
	output g;

	wire w;

	and (w,p1,g2);
	or (g,g1,w);

endmodule

module pg_from_two_levels(p1,g1,p2,g2,p,g);

	input p1,g1,p2,g2;
	output p,g;

	wire w;

	and (p,p1,p2);
	and (w,p1,g2);
	or (g,w,g1);

endmodule