library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity homework5_1 is
port (opcode: in std_logic_vector(4 downto 0);
		--opcode2: in std_logic_vector(1 downto 0);
		clk: in std_logic;
		a,b: in std_logic_vector(31 downto 0);
		y: out std_logic_vector(31 downto 0)
		);
end homework5_1;

architecture rtl of homework5_1 is
signal alu_out: std_logic_vector(31 downto 0);
begin
	process (clk)
		begin	
			if (rising_edge (clk)) then
				case opcode(4 downto 2) is
					when "000" => alu_out <= a;
					when "001" => alu_out <= a+b;
					when "010" => alu_out <= a-b;
					when "011" => alu_out <= a and b;
					when "100" => alu_out <= a or b;
					when "101" => alu_out <= a+'1';
					when "110" => alu_out <= a-'1';
					when "111" => alu_out <= b;
					when others => alu_out <= "00000000000000000000000000000000";
				end case;
				case opcode(1 downto 0) is
					when "00" => y <= alu_out;
					when "01" => y <= alu_out (30 downto 0) & '0'; -- SLL 1;
					when "10" => y <= '0' & alu_out (31 downto 1); -- SRL 1;
					when "11" => y <= "00000000000000000000000000000000";
					when others => y <= NULL;
				end case;
			end if;
		end process;
end rtl;