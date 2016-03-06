library ieee;
use ieee.std_logic_1164.all;

entity part2 is
port( 
		--SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		x: in std_logic_vector(3 downto 0);
		y: in std_logic_vector(3 downto 0);
		sel: in std_logic;
		ledr : out std_logic_vector(9 downto 0)	--red LEDs
		); 
end part2;


architecture Behavior of part2 is
begin
	process(x,y,sel)
		begin
			if(sel='0')then
				ledr(9)<='0';
				ledr(8)<='0';
				ledr(7)<='0';
				ledr(6)<='0';
				ledr(5)<='0';
				ledr(4)<='0';
				ledr(3)<=x(3);
				ledr(2)<=x(2);
				ledr(1)<=x(1);
				ledr(0)<=x(0);
			else
				ledr(9)<='0';
				ledr(8)<='0';
				ledr(7)<='0';
				ledr(6)<='0';
				ledr(5)<='0';
				ledr(4)<='0';
				ledr(3)<=y(3);
				ledr(2)<=y(2);
				ledr(1)<=y(1);
				ledr(0)<=y(0);
			end if;
	end process;
end Behavior;