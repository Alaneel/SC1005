// shift register 1

module shiftreg (input clk, y, output reg Q);

    reg [4:0] q;

    always @ (posedge clk)
        begin
           q[0] <= y;
           q[4:1] <= q[3:0];
           Q <= q[4];
        end

endmodule