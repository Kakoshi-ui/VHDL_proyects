library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bcd_lett_tb is
end bcd_lett_tb;

architecture Behavioral of bcd_lett_tb is
signal in_comp : std_logic_vector (2 downto 0);
signal s_bcd_lett : std_logic_vector (6 downto 0); 

begin
uut:
entity work.bcd_lett port map(in_comp,s_bcd_lett);

stimulus:
process
    begin
    in_comp <= "100";
    wait for 10 ns;
    
    in_comp <= "010";
    wait for 10 ns;
    
    in_comp <= "001";
    wait for 10 ns;
end process;
end Behavioral;
