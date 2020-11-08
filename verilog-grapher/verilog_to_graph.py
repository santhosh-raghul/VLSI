def verilog_to_graph(file_name):

	verilog_file = open(file_name,'r')
	GATES=['not','and','or','nand','nor','xor','xnor','buf']
	inputs=[]
	outputs=[]
	gates=[]
	wires=[]
	lines=verilog_file.readlines()
	verilog_file.close()

	for line in lines:

		line=line.lstrip()
		if(line.startswith('input')):
			inputs.extend([x.strip(',;\n ') for x in line.lstrip('input').split(',')])
		elif(line.startswith('output')):
			outputs.extend([x.strip(',;\n ') for x in line.lstrip('output').split(',')])

		elif(any(g in line for g in GATES)):
			gate,nodes=[x.strip(',;\n ()') for x in line.split('(')]
			gate=gate.split(' ')[1]
			gates.append(gate)
			nodes=[x.strip(' ') for x in nodes.split(',')]
			outp=nodes[0]
			inp=nodes[1:]

			if outp in outputs:
				wires.append([outp,gate,[outp]])
			else:
				flag=1
				for i in wires:
					if i[0]==outp:
						i[1]=gate
						flag=0
						break
				if flag:
					wires.append([outp,gate,[]])

			for i in inp:
				if i in inputs:
					flag=1
					for j in wires:
						if j[0]==i:
							j[2].append(gate)
							flag=0
							break
					if flag:
						wires.append([i,i,[gate]])
				else:
					flag=1
					for j in wires:
						if j[0]==i:
							j[2].append(gate)
							flag=0
							break
					if flag:
						wires.append([i,' ',[gate]])

	if(True): # add condition later if needed
		print("input nodes: ",inputs,"\noutput nodes:",outputs,"\ngate labels: ",gates,"\nwires:")
		x=max([len(str(i[2])) for i in wires])
		print(("+===============+==========+{:=^"+str(x)+"}+").format(''))
		print(("|{:^15}|{:^10}|{:^"+str(x)+"}|").format("wire_label","from","to"))
		print(("+===============+==========+{:=^"+str(x)+"}+").format(''))
		for i in wires:
			print(("|{:^15}|{:^10}|{:^"+str(x)+"}|").format(i[0],i[1],str(i[2])[1:-1]))
		print(("+===============+==========+{:=^"+str(x)+"}+").format(''))

	return inputs,outputs,gates,wires