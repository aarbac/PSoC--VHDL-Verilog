





library ieee;
use ieee.std_logic_1164.all;

entity part4 is
port( 
		c: in std_logic_vector(1 downto 0);
		hex : out std_logic_vector(6 downto 0)	--hex Display
		); 
end part4;


architecture Behavior of part4 is
begin
	process(c)
		begin
			if(c="00")then
				hex(6)<='0';
				hex(5)<='1';
				hex(4)<='0';
				hex(3)<='0';
				hex(2)<='0';
				hex(1)<='0';
				hex(0)<='1';
			elsif(c="01")then
				hex(6)<='0';
				hex(5)<='0';
				hex(4)<='0';
				hex(3)<='0';
				hex(2)<='1';
				hex(1)<='1';
				hex(0)<='0';
			elsif(c="10")then
				hex(6)<='1';
				hex(5)<='1';
				hex(4)<='1';
				hex(3)<='1';
				hex(2)<='0';
				hex(1)<='0';
				hex(0)<='1';
			else
				hex(6)<='0';
				hex(5)<='0';
				hex(4)<='0';
				hex(3)<='0';
				hex(2)<='0';
				hex(1)<='0';
				hex(0)<='0';
			end if;
	end process;
end Behavior;