----------------------------------------------------------------------------------
-- Engineer: AlVg
-- 
-- Create Date: 01/02/2024 11:06:35 AM
-- Design Name: 
-- Module Name: clk_pulse - Behavioral
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

entity clk_pulse is
    port(   clk_190: in std_logic;
            clr: in std_logic;
            go: in std_logic;
            pulse: out std_logic);
end clk_pulse;

architecture Behavioral of clk_pulse is
signal delay1: std_logic;
signal delay2: std_logic;
signal delay3: std_logic;

begin
    delays: process(clr, clk_190)
    begin
        if(clr = '1') then
            delay1 <= '0';
            delay2 <= '0';
            delay3 <= '0';
        elsif(rising_edge(clk_190)) then
            delay1 <= go;
            delay2 <= delay1;
            delay3 <= delay2;
            pulse <= delay1 and delay2 and (not delay3);
        end if;
    end process delays;

end Behavioral;