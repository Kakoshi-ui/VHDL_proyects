library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vga_800x600_tb is
end vga_800x600_tb;

architecture Behavioral of vga_800x600_tb is
signal clk, clr: std_logic;
signal hsync: std_logic;
signal vsync: std_logic;
signal hc: std_logic_vector(10 downto 0);
signal vc: std_logic_vector(9 downto 0);
signal vidon: std_logic;

begin
    uut: entity work.vga_800x600 port map(clk, clr, hsync, vsync, hc, vc, vidon);

    clock: process
    begin
        clk <= '0';
        wait for 10 ns;

        clk <= '1';
        wait for 10 ns;
    end process clock;

    stimulus: process
    begin
        clr <= '1';
        wait for 1 ns;

        clr <= '0';
        wait for 1500 ms;
    end process stimulus;
end Behavioral;
