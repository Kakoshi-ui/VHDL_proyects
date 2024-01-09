----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/02/2024 12:49:46 PM
-- Design Name: 
-- Module Name: vga_controller_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity vga_controller_tb is
end vga_controller_tb;

architecture Behavioral of vga_controller_tb is
signal clk_25: std_logic;
signal clr: std_logic;
signal hc: std_logic_vector (9 downto 0);
signal vc: std_logic_vector (9 downto 0);
signal hsync: std_logic;
signal vsync: std_logic;
signal vidon: std_logic;

begin
    uut: entity work.vga_controller port map(clk_25, clr, hc, vc, hsync, vsync, vidon);

    clock: process
    begin
        clk_25 <= '0';
        wait for 20 ns;
        
        clk_25 <= '1';
        wait for 20 ns;
    end process clock;

    stimulus: process
    begin
        clr <= '1';
        wait for 200 ns;
        
        clr <= '0';
        wait for 1500 ms;
    end process stimulus;
end Behavioral;