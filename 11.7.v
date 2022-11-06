module counter6 (input clk, rst, input [5:0] start_val, output out);

    reg [5:0] cnt, ncnt;

    assign out = (cnt <= 0);

    always @ (posedge clk)
    begin
        if (rst)
            cnt = start_val;
        else
            cnt = ncnt;
    end

    always @ *
    begin
        ncnt = cnt;
        if (ncnt <= 0)
            ncnt = start_val;
        else
            ncnt = cnt - 1'b1;
    end

endmodule