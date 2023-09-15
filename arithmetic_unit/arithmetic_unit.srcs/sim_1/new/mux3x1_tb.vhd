----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/05/2023 12:49:30 PM
-- Design Name: 
-- Module Name: mux3x1_tb - Behavioral
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

entity mux3x1_tb is
end mux3x1_tb;

architecture Behavioral of mux3x1_tb is
signal selec: std_logic_vector (1 downto 0);
signal sum_in: std_logic_vector (4 downto 0);
signal res_in: std_logic_vector (4 downto 0);
signal a_in: std_logic_vector (3 downto 0);
signal s_bcd_unit: std_logic_vector (3 downto 0);

begin
uut:
entity work.mux3x1 port map(selec,sum_in,res_in,a_in,s_bcd_unit);

stimulus:
process
begin
	sum_in <= "10010";
	res_in <= "10011";
	a_in <= "1001";
	selec <= "00";
	wait for 10 ns;
	
	sum_in <= "10010";
	res_in <= "10011";
	a_in <= "1001";
	selec <= "01";
	wait for 10 ns;
	
	sum_in <= "10010";
	res_in <= "10011";
	a_in <= "1001";
	selec <= "10";
	wait for 10 ns;
	
	sum_in <= "11001";
	res_in <= "11001";
	a_in <= "1000";
	selec <= "00";
	wait for 10 ns;
	
	sum_in <= "11001";
	res_in <= "11001";
	a_in <= "1000";
	selec <= "01";
	wait for 10 ns;
	
	sum_in <= "11001";
	res_in <= "11001";
	a_in <= "1000";
	selec <= "10";
	wait for 10 ns;
	
end process;

end Behavioral;
