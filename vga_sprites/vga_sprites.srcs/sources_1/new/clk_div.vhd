----------------------------------------------------------------------------------
-- Engineer: AlVg
-- 
-- Create Date: 01/02/2024 11:06:35 AM
-- Design Name: 
-- Module Name: clk_div - Behavioral
-- Project Name: vga_sprites
-- Target Devices: Artix-7/Basys3
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

entity clk_div is
    port(   mclk:   in std_logic;
            clr:    in std_logic;
            clk_25: out std_logic;
            clk_190:out std_logic);
end clk_div;

architecture Behavioral of clk_div is
--counter signals
signal counter1: std_logic_vector(1 downto 0);
signal counter2: std_logic_vector(18 downto 0);
--temporal output values
signal tmp1: std_logic:= '0';
signal tmp2: std_logic:= '0'; 

begin
    clock_25M: process(mclk, clr)
    begin
        if (clr = '1') then
            counter1 <= "00";
        elsif (rising_edge(mclk)) then
            if (counter1(0) = '1') then
                counter1 <= (others => '0');
                tmp1 <= not tmp1;
            else
                counter1 <= counter1 + 1;
            end if;
        end if;
    end process clock_25M;
    clk_25 <= tmp1;
    
    clock_190: process(mclk, clr)
    begin
        if(clr = '1') then
            counter2 <= (others => '0');
        elsif (rising_edge(mclk)) then
            if (counter2(18) = '1') then
                counter2 <= (others => '0');
                tmp2 <= not tmp2;
            else
                counter2 <= counter2 + 1;
            end if;
        end if;
    end process clock_190;
    clk_190 <= tmp2;

end Behavioral;
