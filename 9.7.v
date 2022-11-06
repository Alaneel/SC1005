// double direction shift register

module shiftreg3 (input clk, y, sh, rt, output q_out, output [4:0] q_word);

    reg [4:0] q;

    always @ (posedge clk)
    begin
        if (sh)
        begin
            if (rt)
            begin
                q[4] <= y;
                q[3:0] <= q[4:1];
            end
            else
            begin
                q[0] <= y;
                q[4:1] <= q[3:0];
            end
        end
    end

    assign q_out = rt ? q[0] : q[4];
    assign q_word = q;

endmodule