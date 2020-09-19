`include "8bit_sr.v"

module top;
reg [7:0] parallel_in;
reg clk,s0,s1,shift_left_input,shift_right_input;
wire [7:0]out;

initial clk = 1'b1;
always #5 clk = ~clk;

eightbitsr shift_register (clk,s0,s1,parallel_in,shift_left_input,shift_right_input,out);

initial
begin
    parallel_in = 8'b10101010;s0=1;s1=1;
    #10 shift_left_input=0;s0=0;
    #80 shift_right_input=1;s1=0;s0=1;
    #80 parallel_in = 8'b10011001;s0=1;s1=1;
    #10 s0=0;s1=0;
    #30 parallel_in = 8'b11110000;s0=1;s1=1;
    #10 s0=0;s1=0; parallel_in = 8'b00001111;
end

initial

begin
    $monitor($time,"  clk = %b  value = %b",clk,out);
    // $monitor($time,"  s1=%b s0=%b out = %b",s1,s0,out);
    $dumpfile("8bit_sr.vcd");
	$dumpvars;
    #250 $finish;
end

endmodule