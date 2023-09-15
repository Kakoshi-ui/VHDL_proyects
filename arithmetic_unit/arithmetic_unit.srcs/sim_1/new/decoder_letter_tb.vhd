----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/28/2023 01:28:32 AM
-- Design Name: 
-- Module Name: decoder_letter_tb - Behavioral
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

entity decoder_letter_tb is
end decoder_letter_tb;

architecture Behavioral of decoder_letter_tb is
signal e,g,l : std_logic;
signal s_dec : std_logic_vector (6 downto 0);

begin
uut:
entity work.decoder_letter port map(e,g,l,s_dec);

stimulus:
process
	begin
	e <= '1';
	g <= '0';
	l <= '0';
	wait for 10 ns;
	
	e <= '0';
	g <= '1';
	l <= '0';
	wait for 10 ns;
	
	e <= '0';
	g <= '0';
	l <= '1';
	wait for 10 ns;
	
end process;
end Behavioral;
