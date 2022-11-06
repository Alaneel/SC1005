// synchronous posedge multibit reset register

module simplereg (input [7:0] a, b, c, input clk, rst, output reg [7:0] q, r, s);

    always @ (posedge clk)
        if (rst) // same as (rst == 1'b1)
            begin
                q <= 8'b0000_0000;
                r <= 8'b0000_0000;
                s <= 8'b0000_0000;
            end 
        else 
            begin
                q <= a;
                r <= b;
                s <= c;
            end

endmodule