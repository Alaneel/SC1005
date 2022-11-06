module vaddoflow (input [3:0] a, b, output [6:0] seg_L, output oflow);

    wire [4:0] x;

    assign x = a + b;

    vsevenseg v1 (.x(x[3:0]), .seg_L(seg_L));

    assign oflow = x[4];

endmodule

module vsevenseg(
    input [3:0] x,         // 4 rightmost switches
   	output reg [6:0] seg_L,    // active low segment display
	);

always @ *
  case (x)
    4'b0000: seg_L = 7'b1000000;
    4'b0001: seg_L = 7'b1111001;
    4'b0010: seg_L = 7'b0100100;
    4'b0011: seg_L = 7'b0110000;
    4'b0100: seg_L = 7'b0011001;
    4'b0101: seg_L = 7'b0010010;
    4'b0110: seg_L = 7'b0000010;
    4'b0111: seg_L = 7'b1111000;
    4'b1000: seg_L = 7'b0000000;
    4'b1001: seg_L = 7'b0010000;
    4'b1010: seg_L = 7'b0001000;
    4'b1011: seg_L = 7'b0000011;
    4'b1100: seg_L = 7'b1000110;
    4'b1101: seg_L = 7'b0100001;
    4'b1110: seg_L = 7'b0000110;
    4'b1111: seg_L = 7'b0001110;
    default: seg_L = 7'b1111111;
  endcase
 
endmodule
