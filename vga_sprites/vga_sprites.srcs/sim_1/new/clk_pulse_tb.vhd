----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/02/2024 12:24:33 PM
-- Design Name: 
-- Module Name: clk_pulse_tb - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;

entity clk_pulse_tb is
end clk_pulse_tb;

architecture Behavioral of clk_pulse_tb is
signal clk_190: std_logic;
signal clr: std_logic;
signal go: std_logic;
signal pulse: std_logic;

begin
    uut: entity work.clk_pulse port map(clk_190, clr, go, pulse);
    
    clock: process
    begin
        clk_190 <= '0';
        wait for 2.631 ms;
        
        clk_190 <= '1';
        wait for 2.631 ms;
    end process clock;
    
    stimulus: process
    begin
        go <= '0';
        clr <= '1';
        wait for 100 ms;
        
        clr <= '0';
        wait for 50 ms;
        
        go <= '1';
        wait for 150 ms;
        
        go <= '0';
        wait for 100 ms;
    end process stimulus;

end Behavioral;
