module monitor (input evnt, rst, clk, input [5:0] thresh, output alarm);

    reg [5:0] cnt, ncnt;

    assign alarm = (cnt > thresh);

    always @ (posedge clk)
    begin
        if (rst)
            cnt <= 6'b000000;
        else
            cnt <= ncnt;
    end

    always @ *
    begin
        ncnt = cnt;
        if (cnt > thresh)
            ncnt = cnt;
        else if (evnt)
            ncnt = cnt + 1'b1;
        else
            ncnt = 6'b000000;
    end

endmodule