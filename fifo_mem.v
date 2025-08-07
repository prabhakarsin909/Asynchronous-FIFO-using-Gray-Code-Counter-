module fifo_mem(
input [7:0] wdata,
input wclken,wclk,wfull,
input [3:0] waddr,raddr,
output [7:0]rdata);

reg [7:0] mem [0:15];

always@(posedge wclk)
begin

if(wclken && !wfull) 
mem[waddr] <=wdata;

end

assign rdata= mem[raddr];

endmodule
