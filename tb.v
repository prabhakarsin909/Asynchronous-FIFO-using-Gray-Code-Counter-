`timescale 1us / 1ps

module tb();
 
	parameter DATA_SIZE=8;

	reg [DATA_SIZE-1:0] wdata;
   reg w_en,wclk,wrst_n,r_en,rclk,rrst_n;

	wire [DATA_SIZE-1:0] rdata;

	wire full,empty;

	always#5 rclk = ~rclk;

	always#10 wclk = ~wclk;
	integer i;

	initial begin

		rclk=0;wclk=0;

		rrst_n=1;wrst_n=1;w_en=1;r_en=0;

		#3 rrst_n=0; wrst_n=0;

		#10 rrst_n=1;

		#10 wrst_n=1; 

		for(i=1;i<100;i=i+2) begin

      #20 wdata = i + 2;
		if(i==41) begin
			r_en=1;
		end
		if(i==81) begin
	      w_en=0;
		end	
		 

		end

		#10 w_en=0;

		#30 

		#300 $finish;

	end

fifo1 dut(.wdata(wdata),.w_en(w_en),.wrst_n(wrst_n),.rclk(rclk),.r_en(r_en),.rrst_n(rrst_n),.rdata(rdata),.full(full),.empty(empty),.wclk(wclk));

endmodule
 