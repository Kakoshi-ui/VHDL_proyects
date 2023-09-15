library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adder_tb is
end adder_tb;

architecture Behavioral of adder_tb is

signal a,b : std_logic_vector (3 downto 0);
signal s: std_logic_vector (7 downto 0);

begin
uut:
entity work.adder port map(a,b,s);

stimulus:
process
begin
a <= "0111";
b <= "0100";
wait for 10 ns;

a <= "0110";
b <= "0011";
wait for 10 ns;

a <= "1001";
b <= "0100";
wait for 10 ns;

a <= "1001";
b <= "1001";
wait for 10 ns;
end process;

end Behavioral;
