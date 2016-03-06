library ieee;
use ieee.std_logic_1164.all;
--Simple module that connects the SW switches to the LEDR lights

entity part3 is
port( 
		--SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		x: in std_logic_vector(1 downto 0);
		y: in std_logic_vector(1 downto 0);
		z: in std_logic_vector(1 downto 0);
		sel: in std_logic_vector(1 downto 0);
		ledr : out std_logic_vector(9 downto 0)	--red LEDs
		); 
end part3;


architecture Behavior of part3 is
begin
	process(x,y,sel)
		begin
			if(sel="00")then
				ledr(9)<='0';
				ledr(8)<='0';
				ledr(7)<='0';
				ledr(6)<='0';
				ledr(5)<='0';
				ledr(4)<='0';
				ledr(3)<='0';
				ledr(2)<='0';
				ledr(1)<=x(1);
				ledr(0)<=x(0);
			elsif(sel="01")then
				ledr(9)<='0';
				ledr(8)<='0';
				ledr(7)<='0';
				ledr(6)<='0';
				ledr(5)<='0';
				ledr(4)<='0';
				ledr(3)<='0';
				ledr(2)<='0';
				ledr(1)<=y(1);
				ledr(0)<=y(0);
			elsif(sel="10")then
				ledr(9)<='0';
				ledr(8)<='0';
				ledr(7)<='0';
				ledr(6)<='0';
				ledr(5)<='0';
				ledr(4)<='0';
				ledr(3)<='0';
				ledr(2)<='0';
				ledr(1)<=z(1);
				ledr(0)<=z(0);
			end if;
	end process;
end Behavior;