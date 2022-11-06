module counter5 (input clk, rst, output out);

    reg [4:0] cnt, ncnt;

    assign out = (cnt > 20);

    always @ (posedge clk)
    begin
        if (rst)
            cnt = 5'b00000;
        else
            cnt = ncnt;
    end

    always @ *
    begin
        ncnt = cnt;
        if (ncnt >= 20)
            ncnt = 5'b00000;
        else
            ncnt = cnt + 1'b1;
    end

endmodule