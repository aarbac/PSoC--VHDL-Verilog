library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity part9 is
port (clk : in std_logic;
		key0: buffer std_logic;
      seconds : buffer std_logic_vector(5 downto 0);
      minutes : buffer std_logic_vector(5 downto 0);
      hundredth : buffer std_logic_vector(6 downto 0);
		hex0,hex1,hex2,hex3,hex4,hex5: out std_logic_vector(6 downto 0)
     );
end part9;

architecture Behavioral of part9 is
signal hundred,sec,min,hour,cool : integer range 0 to 99 :=0;
signal x,y,a,b,c,d,p : integer range 0 to 10 :=0;
signal count : integer :=1;
signal clk1 : std_logic :='0';
begin
seconds <= conv_std_logic_vector(sec,6);
minutes <= conv_std_logic_vector(min,6);
hundredth <= conv_std_logic_vector(hundred,7);
key0<='0';
 --clk generation.For 50 MHz clock this generates 1 Hz clock.
process(clk)
begin
	if(clk'event and clk='1') then
		count <=count+1;
		if(count >= 250000) then
			clk1 <= not clk1;
			count<=1;
		end if;
	end if;
end process;

process(clk1,key0)
begin
	if (key0='0') then
		cool<=cool+1;
		p<=cool rem 2;
	end if;
	if(p=1) then
		if(clk1'event and clk1='1') then
			hundred<=hundred+1;
			if(hundred = 99) then
				hundred<=0;
				sec <= sec+ 1;
				if(sec = 59) then
					sec<=0;
					min <= min + 1;
					if(min = 59) then
						min <= 0;
					end if;
				end if;
			end if;
		end if;
	elsif (p=0) then
		hex0<="1111111";
		hex1<="1111111";
		hex2<="1111111";
		hex3<="1111111";
		hex4<="1111111";
		hex5<="1111111";
	end if;

y<=hundred/10;
x<=hundred rem 10;

		if (x<=0) then
			hex0<="1000000"  ;
		elsif (x<=1) then
			hex0<="1111001"  ;
		elsif (x<=2) then
			hex0<="0100100"  ;
		elsif (x<=3) then
			hex0<="0110000"  ;
		elsif (x<=4) then
			hex0<="0011001"  ;
		elsif (x<=5) then
			hex0<="0010010"  ;
		elsif (x<=6) then
			hex0<="0000010"  ;
		elsif (x<=7)then
			hex0<="1111000"  ;
		elsif (x<=8) then
			hex0<="0000000"  ;
		elsif (x<=9) then
			hex0<="0010000"  ;
		end if;
		
		if (y<=0) then
			hex1<="1000000"  ;
		elsif (y<=1) then
			hex1<="1111001"  ;
		elsif (y<=2) then
			hex1<="0100100"  ;
		elsif (y<=3) then
			hex1<="0110000"  ;
		elsif (y<=4) then
			hex1<="0011001"  ;
		elsif (y<=5) then
			hex1<="0010010"  ;
		elsif (y<=6) then
			hex1<="0000010"  ;
		elsif (y<=7)then
			hex1<="1111000"  ;
		elsif (y<=8) then
			hex1<="0000000"  ;
		elsif (y<=9) then
			hex1<="0000100"  ;
		end if;
		
b<=sec/10;
a<=sec rem 10;

		if (a<=0) then
			hex2<="1000000"  ;
		elsif (a<=1) then
			hex2<="1111001"  ;
		elsif (a<=2) then
			hex2<="0100100"  ;
		elsif (a<=3) then
			hex2<="0110000"  ;
		elsif (a<=4) then
			hex2<="0011001"  ;
		elsif (a<=5) then
			hex2<="0010010"  ;
		elsif (a<=6) then
			hex2<="0000010"  ;
		elsif (a<=7)then
			hex2<="1111000"  ;
		elsif (a<=8) then
			hex2<="0000000"  ;
		elsif (a<=9) then
			hex2<="0010000"  ;
		end if;
		
		if (b<=0) then
			hex3<="1000000"  ;
		elsif (b<=1) then
			hex3<="1111001"  ;
		elsif (b<=2) then
			hex3<="0100100"  ;
		elsif (b<=3) then
			hex3<="0110000"  ;
		elsif (b<=4) then
			hex3<="0011001"  ;
		elsif (b<=5) then
			hex3<="0010010"  ;
		elsif (b<=6) then
			hex3<="0000010"  ;
		elsif (b<=7)then
			hex3<="1111000"  ;
		elsif (b<=8) then
			hex3<="0000000"  ;
		elsif (b<=9) then
			hex3<="0010000"  ;
		end if;
		
d<=min/10;
c<=min rem 10;

		if (c<=0) then
			hex4<="1000000"  ;
		elsif (c<=1) then
			hex4<="1111001"  ;
		elsif (c<=2) then
			hex4<="0100100"  ;
		elsif (c<=3) then
			hex4<="0110000"  ;
		elsif (c<=4) then
			hex4<="0011001"  ;
		elsif (c<=5) then
			hex4<="0010010"  ;
		elsif (c<=6) then
			hex4<="0000010"  ;
		elsif (c<=7)then
			hex4<="1111000"  ;
		elsif (c<=8) then
			hex4<="0000000"  ;
		elsif (c<=9) then
			hex4<="0010000"  ;
		end if;
		
		if (d<=0) then
			hex5<="1000000"  ;
		elsif (d<=1) then
			hex5<="1111001"  ;
		elsif (d<=2) then
			hex5<="0100100"  ;
		elsif (d<=3) then
			hex5<="0110000"  ;
		elsif (d<=4) then
			hex5<="0011001"  ;
		elsif (d<=5) then
			hex5<="0010010"  ;
		elsif (d<=6) then
			hex5<="0000010"  ;
		elsif (d<=7)then
			hex5<="1111000"  ;
		elsif (d<=8) then
			hex5<="0000000"  ;
		elsif (d<=9) then
			hex5<="0010000"  ;
		end if;
		
end process;

end Behavioral;