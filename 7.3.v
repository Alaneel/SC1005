module whatisit (input a, b, c, d, e, output x, y);

    assign {x, y} = {((a & b) | b | ~c | d | e), a & b & ~e};
    // equivalent to assign {x, y} = {((a & b) | ~((~b & c) & ~(d | e))), (~e & (a & b))};

endmodule