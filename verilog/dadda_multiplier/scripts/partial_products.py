N=16

for i in range(N-1,0,-1):
	k=N-i-1
	print()
	l=k
	for j in range(N-1,k-1,-1):
		print('assign level1[%d][%d] = a[%d]&b[%d];'%(k+1,l+1,j,i))
		l+=1
	for j in range(i-1,0,-1):
		print('assign level1[%d][%d] = a[%d]&b[%d];'%(k+1,l+1,k,j))
		l+=1
	print('assign level1[%d][%d] = a[%d]&b[0];'%(k+1,l+1,k))
	l+=1

print()
print('assign level1[%d][%d] = a[%d]&b[0];'%(N,N,N-1))