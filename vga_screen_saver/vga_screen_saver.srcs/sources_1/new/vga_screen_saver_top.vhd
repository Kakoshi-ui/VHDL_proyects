library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vga_screen_saver_top is
    port(   MCLK:  in std_logic;
            CLR:   in std_logic;
            GO:    in std_logic;
            HSYNC: out std_logic;
            VSYNC: out std_logic;
            RED:   out std_logic_vector(3 downto 0);
            GREEN: out std_logic_vector(3 downto 0);
            BLUE:  out std_logic_vector(3 downto 0));
end vga_screen_saver_top;

architecture Behavioral of vga_screen_saver_top is

begin

end Behavioral;
