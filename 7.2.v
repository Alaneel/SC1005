module dec2to4 (input [1:0] i, input en, output [3:0] d);

    always @(*)
        case (en)
            1'b1: 
                case (i)
                    2'b11: d[3:0] = 4'b1000;
                    2'b10: d[3:0] = 4'b0100;
                    2'b01: d[3:0] = 4'b0010;
                    2'b00: d[3:0] = 4'b0001;
                endcase
            1'b0:
                d = 4'b0000;
        endcase

endmodule
    