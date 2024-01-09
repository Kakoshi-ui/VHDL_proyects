library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity clock_div_tb is
end clock_div_tb;

architecture Behavioral of clock_div_tb is
signal clk, clr: std_logic;
signal clk_40: std_logic;

begin

    uut: entity work.clk_div port map(clk, clr, clk_40);

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
        wait for 40 ns;

        clr <= '0';
        wait for 1000 ms;
    end process;
end Behavioral;
