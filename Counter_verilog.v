module homework3_5 ( clk ,clear, load, enable, din, q );
output [3:0] q;
reg [3:0] q;
input clk;
wire clk;
input clear;
wire clear;
input load;
wire load;
input enable;
wire enable;
input [3:0] din;
always @(posedge (clk)) begin
		if (~clear) 		//if clear=0, output should be zero
			q<= 0;
		else if (~load)
		q<=din;
		else if (enable)
		q<= q + 1; //increment the count
		end 
endmodule