module w2r(
input [4:0] wptr,
input rclk, rrst_n,
output reg [4:0] w2r_wptr);

reg [4:0] w2r_temp;

always@(posedge rclk) begin

if(!rrst_n) {w2r_wptr,w2r_temp} <=0;
else {w2r_wptr,w2r_temp}<={w2r_temp,wptr};
end 
endmodule
