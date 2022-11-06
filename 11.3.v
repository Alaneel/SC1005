module arch1 (input [6:0] a, b, input clk, output reg [13:0] total);

    reg [6:0] int1;

    always @ (posedge clk)
    begin
        int1 <= a + b;
        total <= int1 * int1;
    end

endmodule