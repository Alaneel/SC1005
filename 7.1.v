module simple_circ(input A, B, C, D, output Y);

    wire int1, int2, int3, int4;

    and(Y, int1, int2);
    not(int1, int3);
    or(int3, A, D);
    and(int2, B, C, int4);
    not(int4, D);

endmodule