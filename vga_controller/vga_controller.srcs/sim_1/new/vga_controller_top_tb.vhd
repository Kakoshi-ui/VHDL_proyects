library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity vga_controller_top_tb is
end vga_controller_top_tb;

architecture Behavioral of vga_controller_top_tb is
signal CLK: std_logic;
signal CLR: std_logic;
signal SW: std_logic_vector (7 downto 0);
signal HSYNC: std_logic;
signal VSYNC: std_logic;
signal RED: std_logic_vector(3 downto 0);
signal GREEN: std_logic_vector(3 downto 0);
signal BLUE: std_logic_vector(3 downto 0);

begin
    uut: entity work.vga_controller_top port map(CLK, CLR, SW, HSYNC, VSYNC, RED, GREEN, BLUE);

    clock: process
    begin
        CLK <= '0';
        wait for 5 ns;

        CLK <= '1';
        wait for 5 ns;
    end process;

    stimulus: process
    begin
        CLR <= '1';
        SW <= "00000000";
        wait for 20 ns;

        CLR <= '0';
        SW <= "00000000";
        wait for 1000 ms;
    end process;
end Behavioral;
