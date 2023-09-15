----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/05/2023 01:08:17 PM
-- Design Name: 
-- Module Name: dec_dec_sig_tb - Behavioral
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

entity dec_dec_sig_tb is
end dec_dec_sig_tb;

architecture Behavioral of dec_dec_sig_tb is
signal input: std_logic_vector (4 downto 0);
signal l: std_logic;
signal sal_dec: std_logic_vector (6 downto 0);

begin
uut: 
entity work.dec_dec_sig port map(input,l,sal_dec);

stimulus:
process
	begin
	
	input <= "01001";
	l <= '0';
	wait for 10 ns;
	
	input <= "10001";
	l <= '0';
	wait for 10 ns;
	
	input <= "10111";
	l <= '1';
	wait for 10 ns;
	
end process;


end Behavioral;
