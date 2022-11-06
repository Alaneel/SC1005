module pulse3 (input b, clk, rst, output x);

    wire n1, n0;
    reg s1, s0;

    assign n1 = s1 ^ s0;
    assign n0 = (~s1&~s0&b) | (s1&~s0);
    assign x = s1 | s0;

    always @ (posedge clk)
    begin
        if (rst)
        begin
            s1 <= 1'b0;
            s0 <= 1'b0;
        end
        else
        begin
            s1 <= n1;
            s0 <= n0;
        end
    end

endmodule