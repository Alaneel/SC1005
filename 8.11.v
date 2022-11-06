module three2eight_decoder (input a, b, c , output reg d0, d1, d2, d3, d4, d5, d6, d7);

    always @(*)
        case ({a, b, c})
            3'b000: {d7, d6, d5, d4, d3, d2, d1, d0} = 8'b00000001;
            3'b001: {d7, d6, d5, d4, d3, d2, d1, d0} = 8'b00000010;
            3'b010: {d7, d6, d5, d4, d3, d2, d1, d0} = 8'b00000100;
            3'b011: {d7, d6, d5, d4, d3, d2, d1, d0} = 8'b00001000;
            3'b100: {d7, d6, d5, d4, d3, d2, d1, d0} = 8'b00010000;
            3'b101: {d7, d6, d5, d4, d3, d2, d1, d0} = 8'b00100000;
            3'b110: {d7, d6, d5, d4, d3, d2, d1, d0} = 8'b01000000;
            3'b111: {d7, d6, d5, d4, d3, d2, d1, d0} = 8'b10000000;
        endcase

endmodule