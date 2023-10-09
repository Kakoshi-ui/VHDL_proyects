library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_div_tb is
end clock_div_tb;

architecture Behavioral of clock_div_tb is
signal clk,clr,clk25,clk190 : std_logic;

begin
    uut: entity work.clock_div port map(clk,clr,clk25,clk190);
    
    clock: process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;
    
    stimulus: process
    begin
        clr <= '1';
        wait for 10 ns;
        
        clr <= '0';
        wait for 2000 ms;
    end process;

end Behavioral;
