 module machine (input s1, s0, in, output n1, n0, out);

    assign n1 = (s0&in) | (s1&~s0);
    assign n0 = (s1&~s0&~in) | (~s1&~s0&in);
    assign out = (s0&in) | (s1&~s0);

 endmodule