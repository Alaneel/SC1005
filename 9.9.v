// serial data transfer (parallel input serial output)

module piso4 (input clk, ld, input [3:0] y, output q_out);

    reg [3:0] q;

    always @ (posedge clk)
    begin
        if (ld) q <= y;
        else
        begin
            q[0] <= y[0];
            q[3:1] <= q[2:0];
        end
    end
    assign q_out = q[3];

endmodule