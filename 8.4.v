module mux4 (output reg q, input [3:0] d, input [1:0] sel);

    always @(*)
        case (sel)
            2'b00: q = d[0];
            2'b01: q = d[1];
            2'b10: q = d[2];
            2'b11: q = d[3];
        endcase

endmodule