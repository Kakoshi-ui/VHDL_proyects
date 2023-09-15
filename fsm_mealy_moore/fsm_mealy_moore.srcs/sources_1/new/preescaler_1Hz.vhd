----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/30/2023 03:29:11 PM
-- Design Name: 
-- Module Name: preescaler_1Hz - Behavioral
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

entity preescaler_1Hz is
	port(	clk: in std_logic;
			reset: in std_logic;
			sal_1Hz: out std_logic);
end preescaler_1Hz;

architecture Behavioral of preescaler_1Hz is
signal count : std_logic_vector (25 downto 0);
signal s_state: std_logic;

begin
process(clk,reset)
	begin
	if (reset = '1') then
		count <= x"00000000";
		sal_1Hz <= '0';
	end if;
	
	if (rising_edge(clk)) then
		count <= count+1;
		if (count = x"3FFDD60") then
			s_state <= '1';
			count <= x"0000000";
		else 
			s_state <= '0';
		end if;
			sal_1Hz <= s_state;
	end if;
end process;
end Behavioral;
