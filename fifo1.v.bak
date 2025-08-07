module fifo1 
 (output [7:0] rdata,
 output full,
 output empty,
 input [7:0] wdata,
 input w_en, wclk, wrst_n,
 input r_en, rclk, rrst_n);
 
 wire [3:0] waddr, raddr;
 wire [4:0] wptr, rptr, r2w_rptr, w2r_wptr;
 
 r2w r1(.r2w_rptr(r2w_rptr), .rptr(rptr),.wclk(wclk), .wrst_n(wrst_n));
 
 w2r w1(.w2r_wptr(w2r_wptr), .wptr(wptr),.rclk(rclk), .rrst_n(rrst_n));
 
 fifo_mem f1(.rdata(rdata), .wdata(wdata),.waddr(waddr), .raddr(raddr),.wclken(w_en), .wfull(full),.wclk(wclk));
						  
 empty e1(.rempty(empty),.raddr(raddr),.rptr(rptr), .w2r_wptr(w2r_wptr),.rinc(r_en), .rclk(rclk),.rrst_n(rrst_n));
 
 full f2(.wfull(full), .waddr(waddr),.wptr(wptr), .r2w_rptr(r2w_rptr),.winc(w_en), .wclk(wclk),.wrst_n(wrst_n));
 
endmodule
