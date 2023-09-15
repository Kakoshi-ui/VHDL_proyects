----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/05/2023 04:16:05 PM
-- Design Name: 
-- Module Name: mux2x1_tb - Behavioral
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

entity mux2x1_tb is
end mux2x1_tb;

architecture Behavioral of mux2x1_tb is
signal selector: std_logic;
signal in_num: std_logic_vector (6 downto 0);
signal in_letter: std_logic_vector (6 downto 0);
signal mux_out: std_logic_vector (6 downto 0);

begin
uut: 
entity work.mux2x1 port map(selector,in_num,in_letter,mux_out);

stimulus:
process
begin
	selector <= '0';
	in_num <= "0000001";
	in_letter <= "0000010";
	wait for 10 ns;
	
	selector <= '1';
	in_num <= "0000001";
	in_letter <= "0000010";
	wait for 10 ns;
	
	selector <= '0';
	in_num <= "1010101";
	in_letter <= "0101010";
	wait for 10 ns;
	
	selector <= '1';
	in_num <= "1010101";
	in_letter <= "0101010";
	wait for 10 ns;
end process;


end Behavioral;
