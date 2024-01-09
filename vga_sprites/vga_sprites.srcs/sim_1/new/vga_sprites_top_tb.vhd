----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/07/2024 07:51:23 PM
-- Design Name: 
-- Module Name: vga_sprites_top_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vga_sprites_top_tb is
end vga_sprites_top_tb;

architecture Behavioral of vga_sprites_top_tb is
signal MCLK: std_logic;
signal CLR: std_logic;
signal GO: std_logic;
signal HSYNC: std_logic;
signal VSYNC: std_logic;
signal RED: std_logic_vector (3 downto 0);
signal GREEN: std_logic_vector (3 downto 0);
signal BLUE: std_logic_vector (3 downto 0);

begin
    uut: entity work.vga_sprites_top port map(MCLK, CLR, GO, HSYNC, VSYNC, RED, GREEN, BLUE);

    clock: process
    begin
        MCLK <= '0';
        wait for 5 ns;

        MCLK <= '1';
        wait for 5 ns;
    end process clock;

    stimulus: process
    begin
        CLR <= '1';
        GO <= '0';
        wait for 100 ms;

        CLR <= '0';
        wait for 100 ms;

        GO <= '1';
        wait for 100 ms;

        GO <= '0';
        wait for 5000 ms;
    end process stimulus;
end Behavioral;
