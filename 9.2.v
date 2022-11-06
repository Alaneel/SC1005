// asynchrounous multibit reset register

module simplereg (input [7:0] d, input clk, reset, output reg [7:0] q);

    always @ (posedge clk or posedge rst)
        begin
            if (rst)
                q <= 8'b0000_0000;
            else
                q <= d; 
        end

endmodule