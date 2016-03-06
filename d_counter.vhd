--code for counter

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_counter is
port(clk,rst:in std_logic;
		q:inout std_logic_vector(3 downto 0));
end d_counter;

architecture rtl2 of d_counter is

component dff1 is
port(d,rst,clk:in std_logic;
		q:out std_logic);
end component;

signal a,b,c,d:std_logic;

begin

a<=not q(0);
b<=q(0) xor q(1);
c<=(q(2)and(not q(1) or not q(0))) or ((not q(2)) and q(1) and q(0));
d<=(q(3)and(not q(2) or not q(1) or not q(0))) or ((not q(3)) and q(2) and q(1) and q(0));

MSB:dff1 port map(a,rst,clk,q(0));
d2:dff1 port map(b,rst,clk,q(1));
d1:dff1 port map(c,rst,clk,q(2));
LSB:dff1 port map(d,rst,clk,q(3));

end rtl2;




--code for d flipflop


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dff1 is

port(d,rst,clk:in std_logic;
		q:out std_logic);
end dff1;

architecture rtl1 of dff1 is
begin
		process (clk)
		variable x:std_logic:='0';
			begin
				if (clk' event and clk='1') then
					if rst='0' then
						x:='0';
					else
						x:=d;
					end if;
				end if;
			q<=x;
		end process;
end rtl1;