module thingamajig (input [3:0] a, b, c, input [1:0] sel, output reg [5:0] result);

    always @(*)
        result = sel[1] ? (sel[0] ? 6'b000000 : {2'b00, c}) : (sel[0] ? {2'b00, b} : {2'b00, a});

endmodule