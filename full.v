module full(
input [4:0] r2w_rptr,
input winc,wclk,wrst_n,
output reg wfull,
output [3:0] waddr,
output reg [4:0] wptr);

reg [4:0] wbin;
wire [4:0] wgraynext, wbinnext;
wire wfull_val;

always @(posedge wclk or negedge wrst_n)
begin

if(!wrst_n) {wbin, wptr}<=0;
else {wbin, wptr}<={wbinnext,wgraynext};

end

assign waddr=wbin[3:0];
assign wbinnext=wbin+(winc & ~wfull);
assign wgraynext = (wbinnext >> 1) ^ wbinnext;


assign wfull_val=((wgraynext[4] !=r2w_rptr[4] ) &&
 (wgraynext[3] !=r2w_rptr[3]) &&
  (wgraynext[2:0]==r2w_rptr[2:0]));
  
always @(posedge wclk or negedge wrst_n)
begin
if(!wrst_n) wfull<=1'b0;
else wfull<=wfull_val;

end
endmodule


