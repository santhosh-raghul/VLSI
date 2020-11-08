f=open("dadda.csv","w")

N=16
for i in range(N-1,0,-1):
	k=N-i-1
	f.write(','*k)
	for j in range(N-1,k-1,-1):
		f.write('a%02d-b%02d,'%(i,j))
	for j in range(i-1,1,-1):
		f.write('a%02d-b%02d,'%(j,k))
	f.write('a00-b%02d\n'%(k))
f.write(','*(N-1)+'a00-b%2d\n'%(N-1))

f.close()