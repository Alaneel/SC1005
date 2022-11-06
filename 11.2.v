module seqdet (input s, r, g, b, a, input clk, rst, output u);

    parameter wait = 3'b000, start = 3'b001, red1 = 3'b010, blue = 3'b011, green = 3'b100, red2 = 3'b101;

    reg [2:0] nst, st;

    assign u = (st == red2);

    always @ (posedge clk)
    begin
        if (rst)
            st <= wait;
        else
            st <= nst; 
    end

    always @ *
    begin
        nst = st;
        case (st)
            wait: if(s) nst = start;
            start: if(a)
                if(r&~b&~g) nst = red1;
                else nst = wait;
            red1: if(a)
                if (b&~r&~g) nst = blue;
                else nst = wait;
            blue: if(a)
                if (g&~r&~b) nst = green;
                else nst = wait;
            green: if(a)
                if (r&~g&~b) nst = red2;
                else nst = wait;
            red2: nst = wait;
            default: nst = wait;
        endcase
    end

endmodule