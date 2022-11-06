// serial data transfer (serial input parallel output)

module sipo4 (input clk, y, output reg [3:0] q);

always @ (posedge clk)
begin
    q[0] <= y;
    q[3:1] <= q[2:0];
end
endmodule