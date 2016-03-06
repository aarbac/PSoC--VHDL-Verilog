library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity homework4_3 is
port(
		rdptrclr, wrptrclr, rden, wren, clk: in std_logic;
		rdinc, wrinc: in std_logic;
		datain: in std_logic_vector (8 downto 0);
		dataout: out std_logic_vector(8 downto 0)
		);
end homework4_3;

architecture rtl of homework4_3 is

type FIFO_Memory is array (0 to 7) of STD_LOGIC_VECTOR (8 downto 0);
shared variable Memory : FIFO_Memory;
shared variable readpointer: natural range 0 to 8;
shared variable writepointer: natural range 0 to 8;

begin
	process(clk)
	begin
	readpointer := 0;
	writepointer := 0;
		if (clk'event and clk='1') then
		if (rdptrclr='1') then --if read clear then read pointer points to the first register
		readpointer:=0;
		elsif (wrptrclr='1') then --if write clear then write pointer points to the first register
		writepointer:=0;
		end if;
		if (rden='1') then --if read enable then read the data from the position of the pointer
		dataout <= Memory(readpointer);			
		elsif (rden='0') then dataout <= "ZZZZZZZZZ";
		end if; 
		if (wren='1') then --if write enable then write the data to the position of the pointer
		Memory(writepointer) := datain;
		end if;
		if (rdinc = '1') then
			readpointer := readpointer+1;
			if(readpointer=8) then --if read pointer reaches value 8 then point back to 0 
				readpointer := 0;
			end if;
		end if;
		if (wrinc = '1') then
			writepointer :=writepointer+1;
			if(writepointer=8) then --if write pointer reaches value 8 then point back to 0
				writepointer:=0;
			end if;
		end if;
	end if;
	end process;
end rtl;