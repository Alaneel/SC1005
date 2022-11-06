module max8 (input [7:0] a, b, c, output reg [7:0] max, min, diff);

    always @ *
        begin
            if (a > b)
            begin
                if (a > c)
                begin
                    max = a;
                    if (b > c)
                        min = c;
                    else
                        min = b;
                end
                
                else
                begin
                    max = c;
                    min = b;
                end
            end
            
            else
            begin
                if (b > c)
                begin
                    max = b;
                    if (a > c)
                        min = c;
                    else
                        min = a;
                end
                
                else
                begin
                    max = c;
                    min = a;
                end
            end
            diff = max - min;
        end

endmodule