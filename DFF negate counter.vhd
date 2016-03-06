library ieee;
use ieee.std_logic_1164.all;

entity homework3_2 is

port (
		clk, nCLR, abc : in std_logic;
		q0: buffer std_logic);
end homework3_2;

Architecture rtl1 of homework3_2 is

component d_ff
port
(		c, d: in std_logic;
		nCLR: in std_logic;
		q: out std_logic);
end component;

begin

bit0: d_ff
port map (clk, not abc , nCLR, q0);

end rtl1;

library ieee;
use ieee.std_logic_1164.all;
entity d_ff is
port
(		c, d: in std_logic;
		nCLR: in std_logic;
		q: out std_logic);
end d_ff;

architecture d_ff_arch of d_ff is
begin
		process (c)
			begin
					if (c'event and c = '1' and nCLR= '0') then
							q <= d;
					end if;
		end process;
end d_ff_arch;