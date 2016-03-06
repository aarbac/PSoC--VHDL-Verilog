library ieee;
use ieee.std_logic_1164.all;


entity part6 is
port( 
		sw: in std_logic_vector(2 downto 0);
		--c: buffer std_logic_vector(1 downto 0);
		hex0,hex1,hex2,hex3,hex4,hex5 : out std_logic_vector(6 downto 0)	--HEX displays
		); 
end part6;


architecture Behavior of part6 is
begin	
	process(sw)
		begin
			if(sw="000")then
				hex0<="1111001";
				hex1<="0000110";
				hex2<="0100001";
				hex3<="1111111";
				hex4<="1111111";
				hex5<="1111111";
				
				
			elsif(sw="001")then
				hex0<="1111111";
				hex1<="1111001";
				hex2<="0000110";
				hex3<="0100001";
				hex4<="1111111";
				hex5<="1111111";
				
				
			elsif(sw="010")then
				hex0<="1111111";
				hex1<="1111111";
				hex2<="1111001";
				hex3<="0000110";
				hex4<="0100001";
				hex5<="1111111";
				
				
			elsif(sw="011")then
				hex0<="1111111";
				hex1<="1111111";
				hex2<="1111111";
				hex3<="1111001";
				hex4<="0000110";
				hex5<="0100001";
				
				
			elsif(sw="100")then
				hex0<="0100001";
				hex1<="1111111";
				hex2<="1111111";
				hex3<="1111111";
				hex4<="1111001";
				hex5<="0000110";
				
				
				
			elsif(sw="101")then
				hex0<="0000110";
				hex1<="0100001";
				hex2<="1111111";
				hex3<="1111111";
				hex4<="1111111";
				hex5<="1111001";
				
				
				
			end if;
	end process;
end Behavior;