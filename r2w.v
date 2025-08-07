module r2w(
input [4:0] rptr,
input wclk, wrst_n,
output reg [4:0] r2w_rptr);

reg [4:0] r2w_temp;

always@(posedge wclk) begin

if(!wrst_n) {r2w_rptr,r2w_temp} <=0;
else {r2w_rptr,r2w_temp}<={r2w_temp,rptr};
end 
endmodule
