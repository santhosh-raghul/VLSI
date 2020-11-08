#	//column 23
# 	wire l2_c23carry[1:0];
#	//5input
#	four_two x46(level2[1][23],level2[2][23],level2[3][23],level2[4][23],level2[5][23],level3[1][23],l2_c23carry[0],l2_c23carry[1]);
#	//5input
#	four_two x51(level2[6][23],level2[7][23],level2[8][23],l2_c24carry[1],l2_c24carry[0],level3[2][23],level3[3][22],level3[4][22]);

alph=['x','w','v','u','t','s','r','q','p','o','n','m','l','k','j','i','h']
al=-1
for i in range(23,6,-1):#8
	al+=1
	print("\t//column %d"%i)
	print("\twire l2_c%dcarry[1:0];"%i)
	print("\t//5input")
	print("\tfour_two %c46(level2[1][%d],level2[2][%d],level2[3][%d],level2[4][%d],level2[5][%d],level3[1][%d],l2_c%dcarry[0],l2_c%dcarry[1]);"%(alph[al],i,i,i,i,i,i,i,i))
	print("\t//5input")
	print("\tfour_two %c51(level2[6][%d],level2[7][%d],level2[8][%d],l2_c%dcarry[1],l2_c%dcarry[0],level3[2][%d],level3[3][%d],level3[4][%d]);"%(alph[al],i,i,i,i+1,i+1,i,i-1,i-1))
	print()