----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/30/2023 03:47:47 PM
-- Design Name: 
-- Module Name: preescaler_1Hz_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity preescaler_1Hz_tb is
end preescaler_1Hz_tb;

architecture Behavioral of preescaler_1Hz_tb is
signal clk : std_logic;
signal sal_1Hz: std_logic;

begin
uut: entity work.preescaler_1Hz port map(clk,sal_1Hz);

stimulus:

clk <= not clk after 5 ns;

end Behavioral;
