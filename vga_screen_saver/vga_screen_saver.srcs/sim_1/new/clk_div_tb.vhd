library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clk_div_tb is
end clk_div_tb;

architecture Behavioral of clk_div_tb is
signal clk, clr, clk_25M, clk_190k: std_logic;

begin

    uut: entity work.clk_div port map(clk, clr, clk_25M, clk_190k);

    clock: process
    begin
        clk <= '0';
        wait for 5 ns;
        
        clk <= '1';
        wait for 5 ns;
    end process clock;

    stimulus: process
    begin
        clr <= '1';
        wait for 20 ns;
        
        clr <= '0';
        wait for 500 ms;
    end process stimulus;
end Behavioral;
