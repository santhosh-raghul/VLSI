`include"32bit_wallace_new_new.v"

module top;

    reg [31:0] a,b;
    wire [63:0]product;
    reg [63:0]pd;
    wire cout;

    multiplier mult (a,b,product,cout);

    always @*
        pd=a*b;

    initial
    begin
        a=32'd324223;b=32'd3254567;
        #5 a=32'hffffffff;b=32'haaaaaaaa;
        $monitor("%t  %d  %d",$time,product,pd);
    end

endmodule
