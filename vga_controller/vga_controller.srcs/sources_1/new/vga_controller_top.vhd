library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vga_controller_top is
    port(   CLK: in std_logic;
            CLR: in std_logic;
            SW: in std_logic_vector (7 downto 0);
            HSYNC: out std_logic;
            VSYNC: out std_logic;
            RED: out std_logic_vector(3 downto 0);
            GREEN: out std_logic_vector(3 downto 0);
            BLUE: out std_logic_vector(3 downto 0)
    );
end vga_controller_top;

architecture Behavioral of vga_controller_top is
signal clk_50M: std_logic;
signal hor_counter: std_logic_vector (10 downto 0);
signal ver_counter: std_logic_vector (9 downto 0);
signal video_on: std_logic;
signal mem: std_logic_vector (39 downto 0);
signal rom_address: std_logic_vector (3 downto 0);

begin

    U1: entity work.clk_div port map(
        clk => CLK,
        clr => CLR,
        clkx => clk_50M
    );

    U2: entity work.vga_800x600 port map(
        clk => clk_50M,
        clr => CLR,
        hsync => HSYNC,
        vsync => VSYNC,
        hc => hor_counter,
        vc => ver_counter,
        vidon => video_on
    );

    U3: entity work.vga_initials port map(
        vidon => video_on,
        hc => hor_counter,
        vc => ver_counter,
        M => mem,
        sw => SW,
        rom_addr4 => rom_address,
        red => RED,
        green => GREEN,
        blue => BLUE
    );

    U4: entity work.prom_initials port map(
        addr => rom_address,
        M => mem
    );
end Behavioral;
