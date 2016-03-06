module confidencecounter (clk, compin, reset, q3, temp);
input clk, compin, reset;
output q3;
output [3:0] temp;
reg [3:0] temp;
reg q3;
always @(posedge clk)
begin
if (reset)
begin
q3=0;
temp=0;
end
else
			if (compin)
			begin
//					if (temp== 4'b 1111)
//					begin
//						temp=4'b 1111;
//					end

					if (temp > 4'b 1101)
					begin
						temp= 4'b 1111;
					end
					else if (temp< 4'b 1101)
					begin
					if (temp<4'b 1000)
					begin
						temp= temp+4'b 0001;
					end
					else
					begin
					temp= temp+ 4'b 0010;
					end
					end
					
					
			end
			else
			begin
					if (temp < 4'b 0011)
					begin
						temp=0;
					end
					else if (temp >= 4'b0011 )
					begin
					if (temp>8)
						temp= temp-4'b 0001;
					else temp= temp-4'b 0010;
							if (temp<4'b 0011)
								temp=0;
					end
			end
			if (compin==1'b Z)
			temp= 0;

q3= temp[3];
end
endmodule