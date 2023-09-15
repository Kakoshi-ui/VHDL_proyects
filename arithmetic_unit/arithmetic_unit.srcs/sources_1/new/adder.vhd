library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adder is
	Port (	a: in std_logic_vector (3 downto 0);
			b: in std_logic_vector (3 downto 0);
			s: out std_logic_vector (7 downto 0));
end adder;

architecture Behavioral of adder is
signal temp: std_logic_vector(4 downto 0);
signal fix: std_logic;
signal complete: std_logic_vector (7 downto 0);

begin

temp <= ('0'&a)+b;
fix <= '1' when (temp > 9) or (temp(4) = '1') else '0';
complete <= ("000"&temp) when (fix = '0') else ("000"&(temp+6));
s <= complete;

end Behavioral;
