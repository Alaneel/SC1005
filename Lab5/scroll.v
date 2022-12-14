module scroll (input clk, rst, output [15:0] display);

    reg [3:0] count;

    wire [3:0] a, b, c, d;

    assign a = count;
    assign b = count + 4'b0001;
    assign c = count + 4'b0010;
    assign d = count + 4'b0011;

    convert c1 (.in(a), .out(display[15:12]));
    convert c2 (.in(b), .out(display[11:8]));
    convert c3 (.in(c), .out(display[7:4]));
    convert c4 (.in(d), .out(display[3:0]));

    always @(posedge clk)
	begin
        if (rst) 
            count <= 4'b0000;
        else
            count <= count + 1'b1;
	end

endmodule

module convert (input [3:0] in, output reg [3:0] out);

    always @ *
        case (in)
            4'd0: out = 4'hA;
            4'd1: out = 4'hA;
            4'd2: out = 4'hC;
            4'd3: out = 4'h0;
            4'd4: out = 4'hF;
            4'd5: out = 4'hF;
            4'd6: out = 4'hE;
            4'd7: out = 4'hE;
            4'd8: out = 4'hA;
            4'd9: out = 4'h1;
            4'd10: out = 4'h5;
            4'd11: out = 4'hA;
            4'd12: out = 4'h9;
            4'd13: out = 4'h0;
            4'd14: out = 4'h0;
            4'd15: out = 4'hD;
            default: out = 4'hA;
        endcase

endmodule