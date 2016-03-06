library ieee;
use ieee.std_logic_1164.all;

entity part5 is
port( 
		sw: in std_logic_vector(9 downto 0);
		c: buffer std_logic_vector(1 downto 0);
		hex0,hex1,hex2 : out std_logic_vector(6 downto 0)	--HEX displays
		); 
end part5;


architecture Behavior of part5 is
component part3
port( 
		
		x: in std_logic_vector(1 downto 0);
		y: in std_logic_vector(1 downto 0);
		z: in std_logic_vector(1 downto 0);
		sel: in std_logic_vector(1 downto 0);
		ledr : out std_logic_vector(1 downto 0)
		); 
end component;

begin
U0: part3 port map (sw(1 DOWNTO 0), sw(3 DOWNTO 2), sw(5 DOWNTO 4), sw(9 DOWNTO 8), c);
	
	process(c,sw)
		begin
			if(c="00")then
				hex0<="1111001";
				hex1<="0000110";
				hex2<="0100001";
			elsif(c="01")then
				hex0<="0100001";
				hex1<="1111001";
				hex2<="0000110";
			elsif(c="10")then
				hex0<="0000110";
				hex1<="0100001";
				hex2<="1111001";
			end if;
	end process;
end Behavior;







library ieee;
use ieee.std_logic_1164.all;

entity part3 is
port( 
		--SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		x: in std_logic_vector(1 downto 0);
		y: in std_logic_vector(1 downto 0);
		z: in std_logic_vector(1 downto 0);
		sel: in std_logic_vector(1 downto 0);
		ledr : out std_logic_vector(1 downto 0)	--red LEDs
		); 
end part3;


architecture Behavior1 of part3 is
begin
	process(x,y,z,sel)
		begin
			if(sel="00")then
				ledr(1)<=x(1);
				ledr(0)<=x(0);
			elsif(sel="01")then
				ledr(1)<=y(1);
				ledr(0)<=y(0);
			elsif(sel="10")then
				ledr(1)<=z(1);
				ledr(0)<=z(0);
			end if;
	end process;
end Behavior1;