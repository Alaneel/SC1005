`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2020 15:48:02
// Design Name: 
// Module Name: vsevenseg_L
// Project Name: Lab3
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


// Experiment 3
// 7 seg_Lment display with SOP logic expressions 
//


module vsevenseg_L(
    input [3:0] x,         // 4 rightmost switches
   	output reg [6:0] seg_L,    // active low seg_Lment display
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
