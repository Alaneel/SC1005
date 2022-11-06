module mux_4_32(output [7:0] mxout, input [7:0] in3, in2, in1, in0, input [1:0] sel, input enable);

    reg [7:0] mux_int;
    assign mxout = enable ? mux_int : 8'd0;
    always @(*)
        case(sel)
            2'b00: mux_int = in0;
            2'b01: mux_int = in1;
            2'b10: mux_int = in2;
            2'b11: mux_int = in3;
        endcase

endmodule