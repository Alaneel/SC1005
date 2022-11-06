module thingamajig (input [3:0] a, b, c, input [1:0] sel, output reg [5:0] result);

    always @(a, b)
    begin
        case (sel)
            2'b00 : result = {2'b00, a};
            2'b01 : result = {2'b00, b};
            2'b10 : result = {2'b00, c};
            2'b11 : result = 6'b000000;
        endcase
    end

endmodule