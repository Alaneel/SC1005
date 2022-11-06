module max8 (input [7:0] a, b, c, output reg [7:0] max, min, diff);

    always @ *
        begin
            if (a > b)
            begin
                if (a > c)
                    max = a;
                else
                    max = c;
                if (b > c)
                    min = c;
                else
                    min = b;
            end
            
            else
            begin
                if (b > c)
                    max = b;
                else
                    max = c;
                if (a > c)
                    min = c;
                else
                    min = a;
            end
            diff[7:0] = max[7:0] - min[7:0];
        end

endmodule