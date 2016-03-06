library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;

entity d_counter_1 is
port( clear, clk, enable, load: in std_logic;
			din: in std_logic_vector(15 downto 0);
			q: out std_logic_vector(15 downto 0));
end d_counter_1;

architecture rtl of d_counter_1 is
signal temp_count: std_logic_vector(15 downto 0);
begin
		process(clk, clear, load)
					begin
						if (clear='0') then
							temp_count<="0000000000000000";
						elsif (clk'event and clk='1') then
							if (load='0') then
								temp_count<= din;
							elsif (enable='1') then
								temp_count<= temp_count + 1;
							end if;
						end if;
					q<= temp_count;
			end process;
end rtl;