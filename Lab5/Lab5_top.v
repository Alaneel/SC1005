`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2020 17:08:32
// Design Name: 
// Module Name: Lab5_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//	Inputs:  100MHz system clock (clk); active high reset (rst)
//	Outputs: Active low 7 segment value (seg_L); Active low anode driver (anode_L)
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// The top level module. It implements the Verilog system shown in Figure 1.

module Lab5_top(input clk, rst, sel, output [6:0] seg_L, output [3:0] anode_L);

    // declare necessary wires here
    wire [15:0] value;
    wire clk_out;

    // instantiate modules here
    scroll uut1 (.clk(clk_out), .rst(rst), .display(value));
    slow_clkgen uut2 (.clk(clk), .rst(rst), .clk_out(clk_out));
    seg7_driver uut3 (.clk(clk), .rst(rst), .sel(sel), .value(value), .anode_d(4'b0000), .seg_L(seg_L), .anode_L(anode_L));

endmodule

module scroll (input clk, rst, output [15:0] display);

    reg [3:0] count;

    always @(posedge clk)
	begin
        if (rst) 
            count <= 4'b0000;
        else
            count <= count + 1'b1;
	end

    wire [3:0] a, b, c, d;

    assign a = count;
    assign b = count + 4'b0001;
    assign c = count + 4'b0010;
    assign d = count + 4'b0011;
    
    convert c1 (.in(a), .out(display[15:12]));
    convert c2 (.in(b), .out(display[11:8]));
    convert c3 (.in(c), .out(display[7:4]));
    convert c4 (.in(d), .out(display[3:0]));

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

module slow_clkgen (input clk, rst, output clk_out);

	reg [24:0] counter;

	always @(posedge clk)
	begin
         if (rst) 
             counter <= 25'd0;
         else
             counter <= counter + 1'b1;
	end

	assign clk_out = counter[24];

endmodule

module seg7_driver(
    input clk,                  // 100Mz system clock
    input rst,                  // Active high rst
    input sel,                  // The sel input
    input [15:0] value,       // the 4 digits to be displayed (each 4-bits)
    input [3:0] anode_d,        // active low 4-bit anode driver. 0000 turns all ON.
    output reg [6:0] seg_L,     // 7-bit active low segment
    output reg [3:0] anode_L    // anode driver output to select the correct 7 seg display
    );

	wire [1:0] seg7_clk;
	wire [15:0] value_sel;
	reg [19:0] count;      
    reg [3:0] selnum;

    // This always block and the following assign statement generate
    // The Two bit SLOW clock, from the 100MHz system clock (clk) for the 7 seg anodes
    always@(posedge(clk))
	   if (rst)        // rst is the middle push button
		  count <= 20'b0;
	   else
		  count <= count+1'b1;
		  
	assign seg7_clk = count[19:18];	   // select the 2 MSBs to drive the 7 seg anodes
	assign value_sel = (sel) ? {8'h22, benchNo_10, benchNo_1} : value;

	// This always block generates
	// 	1. The value displayed on each 7-seg display (selnum[3:0])
    //	2. The one-hot active low 7 seg display anode select signals (anode_L[3:0])
    always @ *          
    begin
         case (seg7_clk)    
            2'd0 :  begin
                        anode_L = {1'b1, 1'b1, 1'b1, anode_d[0]};
                        selnum = value_sel[3:0];
                    end
            2'd1 :  begin
                        anode_L = {1'b1, 1'b1, anode_d[1], 1'b1};
                        selnum = value_sel[7:4];
                    end
            2'd2 :  begin
                        anode_L = {1'b1, anode_d[2], 1'b1, 1'b1};
                        selnum = value_sel[11:8];
                    end
            2'd3 :  begin
                        anode_L = {anode_d[3], 1'b1, 1'b1, 1'b1};
                        selnum = value_sel[15:12];
                    end
        endcase
    end

// **************** You should NOT modify the code above ****************** //

// Enter your Bench Number here. If required, add the offset given
    wire [3:0] benchNo_10 = 4'd0;  // Enter the tens digit of YOUR bench number
    wire [3:0] benchNo_1 = 4'd0;   // Enter the ones digit of YOUR bench number


// the 7 -bit segments
    always @ *
    begin
        case (selnum)
            4'd0  : seg_L = 7'b100_0000;
            4'd1  : seg_L = 7'b111_1001;
            4'd2  : seg_L = 7'b010_0100;
            4'd3  : seg_L = 7'b011_0000;            
            4'd4  : seg_L = 7'b001_1001;
            4'd5  : seg_L = 7'b001_0010;
            4'd6  : seg_L = 7'b000_0010;
            4'd7  : seg_L = 7'b111_1000;
            4'd8  : seg_L = 7'b000_0000;
            4'd9  : seg_L = 7'b001_0000;
            // 4'd10 : seg_L = 7'b000_1000;
            4'd11 : seg_L = 7'b000_0011;
            4'd12 : seg_L = 7'b100_0110;
            4'd13 : seg_L = 7'b010_0001;
            4'd14 : seg_L = 7'b000_0110;
            4'd15 : seg_L = 7'b000_1110;        
            default: seg_L = 7'b111_1111;
        endcase
    end

endmodule