module decoder3_8(output reg [7:0] d_out, input [2:0] ival);

always @(*)
    case(ival)
        3'b000: d_out = 8'b00000001;
        3'b001: d_out = 8'b00000010;
        3'b010: d_out = 8'b00000100;
        3'b011: d_out = 8'b00001000;
        3'b100: d_out = 8'b00010000;
        3'b101: d_out = 8'b00100000;
        3'b110: d_out = 8'b01000000;
        3'b111: d_out = 8'b10000000;
    endcase
    
endmodule