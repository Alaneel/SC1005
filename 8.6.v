module traffic_light (input [2:0] in, output [1:0] out);

    always @(*)
        case (in[2:0])
            3'b100: out[1:0] = 2'b00;
            3'b010: out[1:0] = 2'b01;
            3'b001: out[1:0] = 2'b10;
            3'b000: out[1:0] = 2'b11;
        endcase
    
endmodule