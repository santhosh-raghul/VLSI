`include"32bit_wallace.v"

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
        $monitor("%t   wallace: %d    multiplication: %d",$time,product,pd);
        a=32'd25;b=32'd8;
        #5 a=32'd324223;b=32'd3254567;
        #5 a=32'hffffffff;b=32'haaaaaaaa;
        #5 a=32'd18487;b=32'd00842;
    end

endmodule
