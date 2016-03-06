




library ieee;
use ieee.std_logic_1164.all;

entity homework9_1 is
port(
		clock,clr,en: in std_logic;
		y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15:out std_logic_vector(15 downto 0)
		);
end homework9_1;

architecture rtl1 of homework9_1 is

component counter
port(
		clk, clear, enable: in std_logic;
		q: out std_logic_vector(15 downto 0)
		);
end component;

begin

counter1: counter port map (clock, clr, en, y0);
counter2: counter port map (clock, clr, en, y1);
counter3: counter port map (clock, clr, en, y2);
counter4: counter port map (clock, clr, en, y3);
counter5: counter port map (clock, clr, en, y4);
counter6: counter port map (clock, clr, en, y5);
counter7: counter port map (clock, clr, en, y6);
counter8: counter port map (clock, clr, en, y7);
counter9: counter port map (clock, clr, en, y8);
counter10: counter port map (clock, clr, en, y9);
counter11: counter port map (clock, clr, en, y10);
counter12: counter port map (clock, clr, en, y11);
counter13: counter port map (clock, clr, en, y12);
counter14: counter port map (clock, clr, en, y13);
counter15: counter port map (clock, clr, en, y14);
counter16: counter port map (clock, clr, en, y15);

end rtl1;



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;

entity counter is
port(
		clk, clear, enable: in std_logic;
		q: out std_logic_vector(15 downto 0)
		);
end counter;

architecture rtl of counter is
signal temp: std_logic_vector(15 downto 0);
--signal flag: std_logic:='0';
begin
	process(clk, clear)
		begin
			if(clear='1') then
				temp<="0000000000000000";
			elsif (clk'event and clk='1') then
				if (enable='1') then
					temp<= temp + "0000000000000001";
					q<=temp;
				end if;
			end if;		
		end process;
end rtl;
