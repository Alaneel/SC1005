`timescale 1ns / 1ps
// ###########################################################################
// BASYS 3: 
// Inputs: clk, rst: 100MHz clk, active high rst.
// Inputs: a, b: From Slider switches
// Inputs: sel: From push button
// Outputs: seg_L: 7-bit active low segment.
// Outputs: anode_L: anode driver to select the correct 7 seg display.
// ##########################################################################
// 7 seg displays are refreshed using an ~95Hz slow clock.
// Each digit is active low for 2.6ms, reftesh every 10.5ms.
// ###########################################################################

module segtoggle(
    input [3:0] a,
    input [3:0] b,
    input clk,
    input rst,
    input sel,
    output reg [6:0] seg_L,
    output reg [3:0] anode_L    // needed to select the correct 7 seg display
    );

	wire [1:0] seg7_clk;
    wire [7:0] x, res;

	reg [19:0] count;      
    reg [3:0] selnum;

    // This always block and the following assign statement generate
    //      The Two bit SLOW clock, from the 100MHz system clock (clk) for the 7 seg anodes
    always@(posedge(clk))
	   if (rst)        // rst is the middle push button
		  count <= 20'b0;
	   else
		  count <= count+1'b1;
		  
	assign seg7_clk = count[19:18];	  // select the 2 MSBs to drive the 7 seg anodes
	assign x = (sel) ? {benchNo_10, benchNo_1} : res;
	
	// This always block generates
	//     1. The value displayed on each 7-seg display (selnum[3:0]) 	  
	//     2. The one-hot active low 7 seg display anode select signals (anode_L[3:0]
    always @ *          
    begin
        anode_L=4'b1111;       // all off
        case (seg7_clk)    
            	2'd0 :  begin
                        anode_L=4'b1110;
                        selnum = x[3:0];
                    end
            	2'd1 :  begin
                        anode_L=4'b1101;
                        selnum = x[7:4];
                    end
            	2'd2 :  begin
                        //anode_L=4'b1011;
                        anode_L=4'b1111;    // all off
                        selnum = 4'd0;
                    end
            	2'd3 :  begin
                        //anode_L=4'b0111;
                        anode_L=4'b1111;    // all off
                        selnum = 4'd0;
                    end
        endcase
    end

	

// **************** Do NOT modify the code above ****************** //

// Enter your Bench Number here. If required, add the offset given
    wire [3:0] benchNo_10 = 4'd0;  // Enter the tens digit of YOUR bench number
    wire [3:0] benchNo_1 = 4'd0;   // Enter the ones digit of YOUR bench number

// Generate the 8-bit product of a and b
    assign res = a * b;   // generate the 8-bit product. 

// COPY YOUR ALWAYS BLOCK HERE AND USE "selnum" AS THE CASE CONDITION
    always @ *
        case (selnum)
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
   
    

