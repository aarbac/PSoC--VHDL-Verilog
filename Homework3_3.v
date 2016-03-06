module Homework3_3 (clk, abc, q0);
input clk, abc;
output q0;
wire q0;
wire temp;
not(temp, abc);
dff1 d1(clk,temp, q0);
endmodule

module dff1 (c,d,q);
input c,d;
output q;
wire c, d;
reg q;
always @(posedge c)
		q<=d;
endmodule