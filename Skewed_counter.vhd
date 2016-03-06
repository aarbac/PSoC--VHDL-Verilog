--------------------------------------------------------------------------------
--
-- File: counter.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::SmartFusion> <Die::A2F200M3F> <Package::484 FBGA>
-- Author: Aaresh Bachana
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity homework7_4 is
port(
		clk, rst: in std_logic;
		q15, q14, q13, q12, q11, q10, q9, q8, q7, q6, q5, q4, sq3, sq2, sq1, sq0, q3, q2, q1, q0: buffer std_logic);
end homework7_4;

architecture rtl1 of homework7_4 is
component d_ff
port(
		c, d, rst: in std_logic;
		q: out std_logic);
end component;

signal i,i1:std_logic;
signal a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,b1,b2:std_logic;
begin
i<=not sq0;
--k<=q0 xor q1;
--l<=(q2 and (not q1 or not q0)) or ((not q2) and q1 and q0);
--m<=(q3 and (not q2 or not q1 or not q0)) or ((not q3) and q2 and q1 and q0);

--a1<=not(sq1);
--a2<=not(sq2);
--a3<=not(sq3);
--a4<=not(q4);
--a5<=not(q5);
--a6<=not(q6);
--a7<=not(q7);
--a8<=not(q8);
--a9<=not(q9);
--a10<=not(q10);
--a11<=not(q11);
--a12<=not(q12);
--a13<=not(q13);
--a14<=not(q14);
--a15<=not(q15);

a1<=q1;
a2<=q2;
a3<=q3;
a4<=q4;
a5<=q5;
a6<=q6;
a7<=q7;
a8<=q8;
a9<=q9;
a10<=q10;
a11<=q11;
a12<=q12;
a13<=q13;
a14<=q14;
a15<=q15;

b1<=not(sq1);
b2<=not(sq2);

i1<=not(q0);

SkewedBit0: d_ff
port map (clk, i, rst, sq0);

SkewedBit1: d_ff
port map (sq0, sq0, rst, sq1);

SkewedBit2: d_ff 
port map (sq1, b1, rst, sq2); 

SkewedBit3: d_ff
port map (sq2, b2, rst, sq3);

Bit0: d_ff
port map (clk, i1, rst, q0);

Bit1: d_ff
port map (clk, i1, rst, q1);

Bit2: d_ff 
port map (clk, a1, rst, q2); 

Bit3: d_ff
port map (clk, a2, rst, q3);

--if (q3='1') then
  --  if (q2='1') then
    --    if (q1='1') then
      --      if (q0='1') then
                Bit4: d_ff
                port map (clk, a3, rst, q4);

                Bit5: d_ff
                port map (clk, a4, rst, q5);

                Bit6: d_ff 
                port map (clk, a5, rst, q6); 

                Bit7: d_ff
                port map (clk, a6, rst, q7);
                
                --if (q7='1') then
                  --  if (q6='1') then
                    --    if (q5='1') then
                      --      if (q4='1') then
                            Bit8: d_ff
                            port map (clk, a7, rst, q8);

                            Bit9: d_ff
                            port map (clk, a8, rst, q9);

                            Bit10: d_ff 
                            port map (clk, a9, rst, q10); 

                            Bit11: d_ff
                            port map (clk, a10, rst, q11);
                    
                           -- if (q11='1') then
                             --   if (q10='1') then
                               --     if (q9='1') then
                                 --       if (q8='1') then
                                        
                                        Bit12: d_ff
                                        port map (sq0, a11, rst, q12);

                                        Bit13: d_ff
                                        port map (sq1, a12, rst, q13);

                                        Bit14: d_ff 
                                        port map (sq2, a13, rst, q14); 

                                        Bit15: d_ff
                                        port map (sq3, a14, rst, q15);
                                        
                                            --end if;
                                        --end if;
                                    --end if;
                                --end if;
                            --end if;
                        --end if;
                    --end if;
                --end if;
            --end if;
        --end if;
    --end if;
--end if;
                                

end rtl1;

library ieee;
use ieee.std_logic_1164.all;

entity d_ff is
port(
		c, d, rst: in std_logic;
		q: out std_logic);
end d_ff;

architecture rtl2 of d_ff is

begin
	process (c)
			begin
				if (c' event and c='1') then
					if rst='1' then
						q<='0';
					else
						q<=d;
					end if;
				end if;
	end process;
end rtl2;