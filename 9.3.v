// up-down binary counter

module simplecnt (input clk, rst, down, load, input [3:0] cnt_in, output reg [3:0] q);

    always @ (posedge clk)
        begin
            if (rst)
                q <= 4'b0000;
            else
                if (load)
                    q <= cnt_in;
                else
                    if (down)
                        q <= q - 1'b1; 
                    else
                        q <= q + 1'b1;
        end

endmodule