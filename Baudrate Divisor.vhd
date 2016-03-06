library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity homework5_2 is
port (
		clk, reset: in std_logic;
		clkout: out std_logic;
		sel: in std_logic_vector(2 downto 0)
		);
end homework5_2;

architecture rtl of homework5_2 is
shared variable temp: std_logic;
shared variable clk_counter: integer;
signal baud_divisor: integer :=0;
begin
	process(clk, reset)
		begin
				if (reset='1') then
					clkout <= '0';
					clk_counter:= 0;
					temp := '0';
				elsif (clk'event and clk='1') then
					case sel is
						when "000" => baud_divisor <= 8; --115200
						when "001" => baud_divisor <= 15;--61440
						when "010" => baud_divisor <= 23;--38400
						when "011" => baud_divisor <= 47;--19200
						when "100" => baud_divisor <= 95;--9600
						when "101" => baud_divisor <= 191;--4800
						when "110" => baud_divisor <= 383;--2400
						when "111" => baud_divisor <= 767;--1200
						when others => baud_divisor <= 8;--115200
					end case;
					
					if (clk_counter < baud_divisor) then
						clk_counter := clk_counter + 1;
					else 	temp := not temp;
						clk_counter := 0;
						clkout <= temp;
					end if;
				end if;
			end process;
end rtl;