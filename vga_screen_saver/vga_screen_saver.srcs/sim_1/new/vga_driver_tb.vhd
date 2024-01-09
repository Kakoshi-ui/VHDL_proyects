library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vga_driver_tb is
end vga_driver_tb;

architecture Behavioral of vga_driver_tb is
signal clk_25M: std_logic;
signal clr: std_logic;
signal hsync: std_logic;
signal vsync: std_logic;
signal hc: std_logic_vector (9 downto 0);
signal vc: std_logic_vector (9 downto 0);
signal vid_enable: std_logic;

begin
    uut: entity work.vga_driver port map(clk_25M, clr, hsync, vsync, hc, vc, vid_enable);
    
    clock: process
    begin
        clk_25M <= '0';
        wait for 20 ns;
        
        clk_25M <= '1';
        wait for 20 ns;
    end process clock;
    
    stimulus: process
    begin
        clr <= '1';
        wait for 20 ns;
        
        clr <= '0';
        wait for 900 ms;
    end process stimulus;

end Behavioral;
