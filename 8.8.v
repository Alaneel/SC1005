module thermo #(parameter width = 8)(input [7:0] Tset, Tact, output reg [11:0] Hon, Con);

    always @(*)
        begin
            if (Tset[width-1:0] - Tact[width-1:0] >= 8'b00000100)
                {Hon, Con} = {12'b1, 12'b0};
            else if (Tact[width-1:0] - Tset[width-1:0] >= 8'b00000100)
                {Hon, Con} = {12'b0, 12'b1};
            else
                {Hon, Con} = {12'b0, 12'b0};
        end

endmodule

module main (input [7:0] Tset, Tact, output [11:0] Hon, Con);

    thermo U1 (.Tset(Tset), .Tact(Tact), .Hon(Hon), .Con(Con));

endmodule