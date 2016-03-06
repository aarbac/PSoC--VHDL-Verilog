library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity part8 is
generic (
n : natural := 4
);
port(
		clk, reset: in std_logic;
		hex0: out std_logic_vector(6 downto 0);
		hex1: out std_logic_vector(6 downto 0);
		hex2: out std_logic_vector(6 downto 0)		
		);
end part8;

architecture rtl of part8 is
signal temp1: std_logic_vector(n-1 downto 0);
signal temp2: std_logic_vector(n-1 downto 0);
signal temp3: std_logic_vector(n-1 downto 0);
signal clk1: std_logic;
signal count: integer := 1;

begin
	process(clk)
		begin
		if (clk'event and clk='1') then
			count<=count+1;
			if (count>=25000000) then
				clk1<=not clk1;
				count<=1;
			end if;
		end if;
	end process;
	
	process(clk1,reset)
		begin 
			if (reset='0') then
				temp1<= (others=> '0');
				temp2<= (others=> '0');
				temp3<= (others=> '0');
			elsif (clk1'event and clk1='1') then
				temp1<=temp1+1;
					if (temp1 > "1001") then
						temp1<= (others=> '0');
						temp2<=temp2+1;
							if (temp2 > "1001") then
								temp2<="0000";
								temp3<=temp3+1;
									if(temp3 > "1001") then
										temp3<="0000";
									end if;
							end if;
					end if;
		if (temp1<="0000") then
			hex0<="1000000"  ;
		elsif (temp1<="0001") then
			hex0<="1111001"  ;
		elsif (temp1<="0010") then
			hex0<="0100100"  ;
		elsif (temp1<="0011") then
			hex0<="0110000"  ;
		elsif (temp1<="0100") then
			hex0<="0011001"  ;
		elsif (temp1<="0101") then
			hex0<="0010010"  ;
		elsif (temp1<="0110") then
			hex0<="0000010"  ;
		elsif (temp1<="0111") then
			hex0<="1111000"  ;
		elsif (temp1<="1000") then
			hex0<="0000000"  ;
		elsif (temp1<="1001") then
			hex0<="0010000"  ;
		end if;
		
		if (temp2<="0000") then
			hex1<="1000000"  ;
		elsif (temp2<="0001") then
			hex1<="1111001" ;
		elsif (temp2<="0010") then
			hex1<="0100100"  ;
		elsif (temp2<="0011") then
			hex1<="0110000"  ;
		elsif (temp2<="0100") then
			hex1<="0011001"  ;
		elsif (temp2<="0101") then
			hex1<="0010010"  ;
		elsif (temp2<="0110") then
			hex1<="0000010"  ;
		elsif (temp2<="0111") then
			hex1<="1111000"  ;
		elsif (temp2<="1000") then
			hex1<="0000000"  ;
		elsif (temp2<="1001") then
			hex1<="0010000"  ;
		end if;
		
		if (temp3<="0000") then
			hex2<="1000000"  ;
		elsif (temp3<="0001") then
			hex2<="1111001"  ;
		elsif (temp3<="0010") then
			hex2<="0100100"  ;
		elsif (temp3<="0011") then
			hex2<="0110000"  ;
		elsif (temp3<="0100") then
			hex2<="0011001"  ;
		elsif (temp3<="0101") then
			hex2<="0010010"  ;
		elsif (temp3<="0110") then
			hex2<="0000010"  ;
		elsif (temp3<="0111") then
			hex2<="1111000"  ;
		elsif (temp3<="1000") then
			hex2<="0000000"  ;
		elsif (temp3<="1001") then
			hex2<="0010000"  ;
		end if;
		end if;
	end process;
end rtl;

				