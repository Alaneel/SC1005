module main(input a, b, c, d, output f);
    assign f = ((~a) | (b & c)) ^ ((b & c) ~| d)
endmodule