----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/02/2024 11:45:38 AM
-- Design Name: 
-- Module Name: clk_div_tb - Behavioral
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

entity clk_div_tb is
end clk_div_tb;

architecture Behavioral of clk_div_tb is
signal mclk: std_logic;
signal clr: std_logic;
signal clk_25: std_logic;
signal clk_190: std_logic;

begin
    uut: entity work.clk_div port map(mclk, clr, clk_25, clk_190);
    
    mclock: process
    begin
        mclk <= '0';
        wait for 5 ns;
        
        mclk <= '1';
        wait for 5 ns;
    end process mclock;
    
    stimulus: process
    begin
        clr <= '1';
        wait for 10 ns;
        
        clr <= '0';
        wait for 1500 ms;
    end process stimulus;

end Behavioral;
