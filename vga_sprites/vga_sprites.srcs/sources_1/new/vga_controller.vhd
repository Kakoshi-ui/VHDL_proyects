----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/02/2024 11:06:35 AM
-- Design Name: 
-- Module Name: vga_controller - Behavioral
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

entity vga_controller is
    port(   clk_25: in std_logic;
            clr:    in std_logic;
            hc: out std_logic_vector (9 downto 0);
            vc: out std_logic_vector (9 downto 0);
            hsync: out std_logic;
            vsync: out std_logic;
            vidon: out std_logic);
end vga_controller;

architecture Behavioral of vga_controller is
--horizontal timing
constant hbp: std_logic_vector (9 downto 0):= "0010010000"; --hbp=sp+bp=96+48=144
constant hfp: std_logic_vector (9 downto 0):= "1100010000"; --hfp=hbp+hv=144+640=784
constant hpixels: std_logic_vector (9 downto 0):= "1100100000"; 
--whole horizontal line=sp+bp+va+fp=96+48+640+16=800

--vertical timing
constant vbp: std_logic_vector (9 downto 0):= "0000100011"; --vbp=sp+bp=2+33=35
constant vfp: std_logic_vector (9 downto 0):= "1000000011"; --hfp=vbp+vv=35+480
constant vlines: std_logic_vector (9 downto 0):= "1000001101";
--whole vertical line=sp+bp+va+fp=2+33+480+10=525

--signals for counters
signal hcs: std_logic_vector (9 downto 0);
signal vcs: std_logic_vector (9 downto 0);

--signal for vertical count
signal vsenable: std_logic;

begin
    hor_count: process(clr, clk_25)
    begin
        if (clr = '1') then
            hcs <= (others => '0');
        elsif (rising_edge(clk_25)) then
            if (hcs = hpixels-1) then
                hcs <= (others => '0');
                vsenable <= '1';
            else 
                hcs <= hcs + 1;
                vsenable <= '0';
            end if;
        end if;
    end process hor_count;
    hsync <= '0' when (hcs < hbp) or (hcs > hfp) else '1';
    
    ver_count: process(clr, clk_25, vsenable)
    begin
        if (clr = '1') then
            vcs <= (others => '0');
        elsif (rising_edge(clk_25) and (vsenable = '1')) then
            if (vcs = vlines-1) then
                vcs <= (others => '0');
            else
                vcs <= vcs + 1;
            end if;
        end if;
    end process ver_count;
    vsync <= '0' when (vcs < vbp) or (vcs > vfp) else '1';
    vidon <= '1' when (((hcs < hfp)and(hcs>=hbp))and((vcs<vfp)and(vcs>=vbp))) else '0';
    
    hc <= hcs;
    vc <= vcs;
end Behavioral;