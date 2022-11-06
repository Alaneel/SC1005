module fifo4 (input clk, input [3:0] y, output reg [3:0] q);

    reg [3:0] q1, q2, q3;

    always @ (posedge clk)
    begin
        q1 <= y;
        q2 <= q1;
        q3 <= q2;
        q <= q3;
    end

endmodule