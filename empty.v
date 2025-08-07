module empty(
input [4:0] w2r_wptr,
input rinc,rclk,rrst_n,

output reg rempty,
output [3:0] raddr,
output reg [4:0] rptr
);

reg [4:0] rbin;
wire [4:0] rgraynext, rbinnext;
wire rempty_val;

always @(posedge rclk or negedge rrst_n) begin
  if(!rrst_n) {rbin,rptr}<=0;
  else {rbin,rptr}<={rbinnext,rgraynext};
end
  
  assign raddr = rbin[3:0];
  assign rbinnext= rbin+ (rinc & ~rempty);
  assign rgraynext= (rbinnext>>1) ^ rbinnext;
  
  assign rempty_val= (rgraynext == w2r_wptr);
  
  always @(posedge rclk or negedge rrst_n)
  begin
  if(!rrst_n) rempty<=1'b1;
  else rempty<=rempty_val; 
  end
 
 endmodule
  