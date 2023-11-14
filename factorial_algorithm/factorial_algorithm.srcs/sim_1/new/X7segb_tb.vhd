library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity X7segb_tb is
end X7segb_tb;

architecture Behavioral of X7segb_tb is

signal x : std_logic_vector (15 downto 0);
signal cclk,clr : std_logic;
signal a_to_g : std_logic_vector (6 downto 0);
signal an : std_logic_vector (3 downto 0);

begin

    uut: entity work.X7segb port map(x, cclk, clr, a_to_g, an);
    
    clock: process
    begin
        cclk <= '0';
        wait for 20 ns;
        
        cclk <= '1';
        wait for 20 ns;
    end process clock;
    
    stimulus: process
    begin
        clr <= '1';
        x <= "0000000000000000";
        wait for 100 ns;
        
        clr <= '0';
        wait for 10 us;
        x <= "0000000001001111";
        wait;
    end process stimulus;


end Behavioral;
