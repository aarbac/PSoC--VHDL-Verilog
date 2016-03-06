




library ieee;
use ieee.std_logic_1164.all;

entity johnsoncounter4bit is
port(
		clk, clr: in std_logic;
		q: out std_logic_vector(7 downto 0)
		);
end johnsoncounter4bit;

architecture rtl of johnsoncounter4bit is
signal temp: std_logic_vector(7 downto 0);
begin
	process (clk, clr)
		begin
			if (clr='1') then
				temp<="01111111";
			elsif (clk'event and clk='1') then
				temp<=temp(6 downto 0) & not (temp(7));
			end if;
		q<=temp;
	end process;
end rtl;