library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity part10 is
port(	
		clk: in std_logic;
		sw: in std_logic_vector(2 downto 0);
		key:in std_logic_vector(1 downto 0);
		ledr: buffer std_logic_vector(9 downto 0)
		);
end part10;

architecture rtl of part10 is
signal count, count1,x,y: integer := 0;
signal clk1: std_logic := '0';
signal temp: std_logic_vector(9 downto 0);
begin
	process(clk,key)
		begin
			if (key(0)='0') then
				--temp<="0000000000";
			elsif (clk'event and clk='1') then
					count<=count+1;
					--temp<="0001111000";
					if (count>=12500000) then
						clk1<=not clk1;
						count<=0;
						--temp<="1111001111";
					end if;
			end if;
	end process;


process(clk1,key(0))
begin
	if(key(1)='0')then
	if (clk1'event and clk1='1') then
	case sw is
		when "000"=>	x<=x+1;						
							if (x=1) then
							temp<="0000000001";
							elsif(x=2)then
							temp<="0000000000";
							elsif(x>2 and x<=4) then
							temp<="0000000001";
							elsif(x=5)then
							temp<="0000000000";
							x<=0;
							end if;
									
						
		when "001"=>
							x<=x+1;
							if(x>=1 and x<=3)then
							temp<="0000000001";
							elsif(x=4)then
							temp<="0000000000";
							elsif(x=5)then
							temp<="0000000001";
							elsif(x=6)then
							temp<="0000000000";
							elsif(x=7)then
							temp<="0000000001";
							elsif(x=8)then
							temp<="0000000000";
							elsif(x=9)then
							temp<="0000000001";
							elsif(x=10)then
							temp<="0000000000";
							x<=0;
							end if;
		when "010"=>
							x<=x+1;
							if(x>=1 and x<=3)then
							temp<="0000000001";
							elsif(x=4)then
							temp<="0000000000";
							elsif(x=5)then
							temp<="0000000001";
							elsif(x=6)then
							temp<="0000000000";
							elsif(x>=7 and x<=9)then
							temp<="0000000001";
							elsif(x=10)then
							temp<="0000000000";
							elsif(x=11)then
							temp<="0000000001";
							elsif(x=12)then
							temp<="0000000000";
							x<=0;
							end if;
					
		when "011"=>
							x<=x+1;
							if(x>=1 and x<=3)then
							temp<="0000000001";
							elsif(x=4)then
							temp<="0000000000";
							elsif(x=5)then
							temp<="0000000001";
							elsif(x=6)then
							temp<="0000000000";
							elsif(x=7)then
							temp<="0000000001";
							elsif(x=8)then
							temp<="0000000000";
							x<=0;
							end if;
							
		when "100"=>
							x<=x+1;
							if(x=1)then
							temp<="0000000001";
							elsif(x=2)then
							temp<="0000000000";
							x<=0;
							end if;
						
		when "101"=>
							x<=x+1;
							if(x=1)then
							temp<="0000000001";
							elsif(x=2)then
							temp<="0000000000";
							elsif(x=3)then
							temp<="0000000001";
							elsif(x=4)then
							temp<="0000000000";
							elsif(x>=5 and x<=7)then
							temp<="0000000001";
							elsif(x=8)then
							temp<="0000000000";
							elsif(x=9)then
							temp<="0000000001";
							elsif(x=10)then
							temp<="0000000000";
							x<=0;
							end if;
							
		when "110" =>
							x<=x+1;
							if(x>=1 and x<=3)then
							temp<="0000000001";
							elsif(x=4)then
							temp<="0000000000";
							elsif(x>=5 and x<= 7)then
							temp<="0000000001";
							elsif(x=8)then
							temp<="0000000000";
							elsif(x=9)then
							temp<="0000000001";
							elsif(x=10)then
							temp<="0000000000";
							x<=0;
							end if;
							
		when "111"=>
							x<=x+1;
							if(x=1)then
							temp<="0000000001";
							elsif(x=2)then
							temp<="0000000000";
							elsif(x=3)then
							temp<="0000000001";
							elsif(x=4)then
							temp<="0000000000";
							elsif(x=5)then
							temp<="0000000001";
							elsif(x=6)then
							temp<="0000000000";
							elsif(x=7)then
							temp<="0000000001";
							elsif(x=8)then
							temp<="0000000000";
							x<=0;
							end if;
						
		when others=> temp<="1110000111";
		
	end case;
	end if;
	end if;
end process;

ledr<=temp;
end rtl;
		

--	process(clk1,sw,key,ledr)
--		begin
--				if (key(0)='1') then
--					ledr<="0000000000";
--				else
--				case sw is
--						when "000"=> 
--										if (clk1'event and clk1='0') then
--											x<=x+1;
--											ledr<= not ledr;
--											if (x>=2) then
--												ledr<="0000000001";
--												y<=y+1;
--												if (y=3) then
--												ledr<="0000000000";
--												x<=0;
--												y<=0;
--												end if;
--											end if;
--										end if;
--						when others=> ledr<="1111111111";
--					end case;
--				end if;
--	end process;
--end rtl;
			
											