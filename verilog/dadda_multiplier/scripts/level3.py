alph=['ab','aa','z','y','x','w','v','u','t','s','r','q','p','o','n','m','l','k','j','i','h','g','f','e','d'] 
al=-1
for i in range(27,2,-1):#2
	al+=1
	print("\t//column %d"%i)
	print("\twire l3_c%dcarry;"%i)
	print("\t//5input")
	print("\tfour_two %s66(level3[1][%d],level3[2][%d],level3[3][%d],level3[4][%d],l3_c%dcarry,level4[1][%d],l3_c%dcarry,level4[2][%d]);"%(alph[al],i,i,i,i,i+1,i,i,i-1))
	print()