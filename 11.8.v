 module machine (input s1, s0, in, output reg n1, n0, out);

    always @ *
    begin
        n1 = (s0&in) | (s1&~s0);
        n0 = (s1&~s0&~in) | (~s1&~s0&in);
        out = (s0&in) | (s1&~s0);
    end

 endmodule