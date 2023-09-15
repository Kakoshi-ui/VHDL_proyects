----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/27/2023 11:51:48 PM
-- Design Name: 
-- Module Name: comparator_tb - Behavioral
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


entity comparator_tb is
end comparator_tb;

architecture Behavioral of comparator_tb is
signal a,b : std_logic_vector (3 downto 0);
signal e,g,l : std_logic;

begin
uut:
entity work.comparator port map(a,b,e,g,l);

stimulus:
process
	begin
	a <= "1010";
	b <= "1010";
	wait for 10 ns;
	
	a <= "1100";
	b <= "1000";
	wait for 10 ns;
	
	a <= "0100";
	b <= "1110";
	wait for 10 ns;
	
end process;
end Behavioral;
