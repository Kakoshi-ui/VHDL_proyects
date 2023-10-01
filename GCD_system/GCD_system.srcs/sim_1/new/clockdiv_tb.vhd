library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clockdiv_tb is
end clockdiv_tb;

architecture Behavioral of clockdiv_tb is
signal clk : std_logic;
signal clr : std_logic;
signal clk190 : std_logic;
signal clk25 : std_logic;

begin
uut: entity work.clockdiv port map(clk,clr,clk190,clk25);

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
    wait for 1 ms;
    
    clr <= '0';
    wait for 20 ms;
end process;
end Behavioral;
