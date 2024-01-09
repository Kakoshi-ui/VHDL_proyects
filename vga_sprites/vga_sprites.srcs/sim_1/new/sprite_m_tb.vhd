----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/03/2024 06:46:37 PM
-- Design Name: 
-- Module Name: sprite_m_tb - Behavioral
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

entity sprite_m_tb is
end sprite_m_tb;

architecture Behavioral of sprite_m_tb is
signal clk_190: std_logic;
signal clr: std_logic;
signal pulse: std_logic;
signal ld_reg: std_logic;
signal cat_addr: std_logic_vector (13 downto 0);
signal ball_addr: std_logic_vector (15 downto 0);

begin
    uut: entity work.sprite_m port map(clk_190, clr, pulse, ld_reg, cat_addr, ball_addr);
    
    clock: process
    begin
        clk_190 <= '0';
        wait for 2.631 ms;
        
        clk_190 <= '1';
        wait for 2.631 ms;
    end process clock;
    
    stimulus: process
    begin
        pulse <= '0';
        clr <= '1';
        wait for 100 ms;
        
        clr <= '0';
        wait for 250 ms;
        
        pulse <= '1';
        wait for 100 ms;
        
        pulse <= '0'; 
        wait for 2500 ms;
    end process stimulus;

end Behavioral;
