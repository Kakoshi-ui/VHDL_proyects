----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/28/2023 09:05:07 AM
-- Design Name: 
-- Module Name: decoder_bcd_tb - Behavioral
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


entity decoder_bcd_tb is
end decoder_bcd_tb;

architecture Behavioral of decoder_bcd_tb is
signal entry : std_logic_vector (3 downto 0);
signal s_dec : std_logic_vector (6 downto 0);

begin
uut: 
entity work.decoder_bcd port map(entry,s_dec);

stimulus:
process
	begin
	entry <= "0001";
	wait for 10 ns;
	
	entry <= "0010";
	wait for 10 ns;
	
	entry <= "0011";
	wait for 10 ns;
	
	entry <= "0100";
	wait for 10 ns;
	
	entry <= "0101";
	wait for 10 ns;
	
	entry <= "0110";
	wait for 10 ns;
	
	entry <= "0111";
	wait for 10 ns;
	
	entry <= "1000";
	wait for 10 ns;
	
	entry <= "1001";
	wait for 10 ns;
end process;
end Behavioral;
