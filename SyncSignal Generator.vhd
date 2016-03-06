library ieee;
use ieee.std_logic_1164.all;

entity homework8_3 is
port
(
clocka, clockb: in std_logic;
m,q0,q1,q2,q3: buffer std_logic;
x0,x1,x2,x3: buffer std_logic;
y0,y1,y2,y3: buffer std_logic;
z0,z1,z2,z3: buffer std_logic;
syncsignal: buffer std_logic;
output0,output1,output2,output3: out std_logic
);
end homework8_3;

architecture rtl of homework8_3 is
component dflipflop
port
(
clk, abc, reset: in std_logic;
q: out std_logic
);
end component;

component mux is
port
(
a,b,sel: in std_logic;
mux_out: out std_logic
);
end component;

begin

syncsignalgenerator: dflipflop port map (clocka, clockb, '0', syncsignal);

tff: dflipflop port map (clocka, not m, '0', m);

shiftreg1: dflipflop port map (clocka, m, '0', q0);

shiftreg2: dflipflop port map (clocka, q0, '0', q1);

shiftreg3: dflipflop port map (clocka, q1, '0', q2);

shiftreg4: dflipflop port map (clocka, q2, '0', q3);

dff1: dflipflop port map (clocka, q0, '0', x0);

dff2: dflipflop port map (clocka, q1, '0', x1);

dff3: dflipflop port map (clocka, q2, '0', x2);

dff4: dflipflop port map (clocka, q3, '0', x3);

mux1: mux port map (y0, x0, syncsignal, y0);

mux2: mux port map (y1, x1, syncsignal, y1);

mux3: mux port map (y2, x2, syncsignal, y2);

mux4: mux port map (y3, x3, syncsignal, y3);

interface_dff1: dflipflop port map (clocka, y0, '0', z0);

interface_dff2: dflipflop port map (clocka, y1, '0', z1);

interface_dff3: dflipflop port map (clocka, y2, '0', z2);

interface_dff4: dflipflop port map (clocka, y3, '0', z3);

datasink_dff1: dflipflop port map (clockb, z0, '0', output0);

datasink_dff2: dflipflop port map (clockb, z1, '0', output1);

datasink_dff3: dflipflop port map (clockb, z2, '0', output2);

datasink_dff4: dflipflop port map (clockb, z3, '0', output3);


end rtl;




library ieee;
use ieee.std_logic_1164.all;

entity dflipflop is
port
(
clk, abc, reset: in std_logic;
q: out std_logic
);
end dflipflop;

architecture rtl1 of dflipflop is
begin
	process(clk, reset)
		begin
		if (reset='1') then
				q<='0';
		elsif (clk'event and clk='1') then
				q<=abc;
		end if;
	end process;
end rtl1;


library ieee;
use ieee.std_logic_1164.all;

entity mux is
port
(
a,b,sel: in std_logic;
mux_out: out std_logic
);
end mux;

architecture rtl2 of mux is
begin
process (a,b,sel)
begin
	if (sel='0') then
		mux_out<=a;
	else
		mux_out<=b;
	end if;
end process;
end rtl2;		