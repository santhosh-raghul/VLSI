import argparse
from verilog_to_graph import verilog_to_graph
from process_graph import process_graph

def main():
	parser=argparse.ArgumentParser(description="convert gate level verilog to a visualizable graph")
	parser.add_argument('verilog_file',type=str,help="path to the verilog module file containing gate level design")
	args=parser.parse_args()
	image_file_name=args.verilog_file.split('.v')[0]+".png"
	input_nodes,output_nodes,nodes,edges=verilog_to_graph(args.verilog_file)
	process_graph(input_nodes,output_nodes,nodes,edges,image_file_name)

if __name__=="__main__":
	main()