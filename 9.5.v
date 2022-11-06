// shift register 2

module shiftreg2 (input clk, y, sh, output q_out);

    reg [4:0] q;

    always @ (posedge clk)
        begin
            if (sh)
                begin
                    q[0] <= y;
                    q[4:1] <= q[3:0];
                end 
        end

    assign q_out = q[4];

endmodule