----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/05/2023 04:01:19 AM
-- Design Name: 
-- Module Name: substractor_tb - Behavioral
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

entity substractor_tb is
end substractor_tb;

architecture Behavioral of substractor_tb is
signal a,b: std_logic_vector (3 downto 0);
signal s: std_logic_vector (7 downto 0);

begin
uut:
entity work.substractor port map(a,b,s);

stimulus:
process
begin
a <= "1001";
b <= "0100";
wait for 10 ns;

a <= "0101";
b <= "0100";
wait for 10 ns;

a <= "0010";
b <= "0001";
wait for 10 ns;

a <= "0100";
b <= "0101";
wait for 10 ns;

a <= "0010";
b <= "0111";
wait for 10 ns;

a <= "1001";
b <= "1001";
wait for 10 ns;

end process;
end Behavioral;
