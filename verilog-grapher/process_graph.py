import networkx as nx
import matplotlib.pyplot as plt

def process_graph(input_nodes,output_nodes,nodes,edges,image_file_name=''):

	G=nx.DiGraph()
	G.add_nodes_from(input_nodes)
	G.add_nodes_from(output_nodes)
	G.add_nodes_from(nodes)

	colour_map=[]
	size=[]
	for node in G:
		if node in input_nodes:
			colour_map.append('red')
		elif node in output_nodes:
			colour_map.append('green')
		else:
			colour_map.append('blue')
		size.append(300*len(node))

	for i in edges:
		for j in i[2]:
			G.add_edge(i[1],j,weight=6)

	nx.draw(G,with_labels=True,node_color=colour_map,node_size=size,arrowsize=20,pos=nx.spring_layout(G,k=7))

	if(True): # add condition later if needed
		l=max(size)/300
		print("paths:")
		for input_node in input_nodes:
			for output_node in output_nodes:
				for path in nx.algorithms.simple_paths.all_simple_paths(G,input_node,output_node):
					for node in path[0:-1]:
						print((" {: <%d} "%l).format(node),end="-->")
					print((" {: <%d}"%l).format(path[-1]))

	if(image_file_name): # add condition later if needed
		plt.savefig(image_file_name)
		print("image stored in",image_file_name,"successfully")

	if(True): # add condition later if needed
		plt.show()