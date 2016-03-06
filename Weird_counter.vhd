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

entity counter is
port(
		clk, rst: in std_logic;
		q15, q14, q13, q12, q11, q10, q9, q8, q7, q6, q5, q4, sq3, sq2, sq1, sq0: buffer std_logic);
end counter;

architecture rtl1 of counter is
component d_ff
port(
		c, d, rst: in std_logic;
		q: out std_logic);
end component;

signal i,k,l,m:std_logic;

begin
i<=not sq0;
--k<=q0 xor q1;
--l<=(q2 and (not q1 or not q0)) or ((not q2) and q1 and q0);
--m<=(q3 and (not q2 or not q1 or not q0)) or ((not q3) and q2 and q1 and q0);

Bit0: d_ff
port map (clk, i, rst, sq0);

Bit1: d_ff
port map (sq0, not(sq0), rst, sq1);

Bit2: d_ff 
port map (sq1, not(sq1), rst, sq2); 

Bit3: d_ff
port map (sq2, not(sq2), rst, sq3);

--if (q3='1') then
  --  if (q2='1') then
    --    if (q1='1') then
      --      if (q0='1') then
                Bit4: d_ff
                port map (sq3, not(sq3), rst, q4);

                Bit5: d_ff
                port map (q4, not(q4), rst, q5);

                Bit6: d_ff 
                port map (q5, not(q5), rst, q6); 

                Bit7: d_ff
                port map (q6, not(q6), rst, q7);
                
                --if (q7='1') then
                  --  if (q6='1') then
                    --    if (q5='1') then
                      --      if (q4='1') then
                            Bit8: d_ff
                            port map (q7, not(q7), rst, q8);

                            Bit9: d_ff
                            port map (q8, not(q8), rst, q9);

                            Bit10: d_ff 
                            port map (q9, not(q9), rst, q10); 

                            Bit11: d_ff
                            port map (q10, not(q10), rst, q11);
                    
                           -- if (q11='1') then
                             --   if (q10='1') then
                               --     if (q9='1') then
                                 --       if (q8='1') then
                                        
                                        Bit12: d_ff
                                        port map (sq0, not(q11), rst, q12);

                                        Bit13: d_ff
                                        port map (sq1, not(q12), rst, q13);

                                        Bit14: d_ff 
                                        port map (sq2, not(q13), rst, q14); 

                                        Bit15: d_ff
                                        port map (sq3, not(q14), rst, q15);
                                        
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
					
					
		
