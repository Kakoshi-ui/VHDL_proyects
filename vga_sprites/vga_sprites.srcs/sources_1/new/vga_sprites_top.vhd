----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/02/2024 11:22:40 AM
-- Design Name: 
-- Module Name: vga_sprites_top - Behavioral
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

entity vga_sprites_top is
    port(   MCLK: in std_logic;
            CLR: in std_logic;
            GO: in std_logic;
            HSYNC: out std_logic;
            VSYNC: out std_logic;
            RED: out std_logic_vector (3 downto 0);
            GREEN: out std_logic_vector (3 downto 0);
            BLUE: out std_logic_vector (3 downto 0));
end vga_sprites_top;

architecture Behavioral of vga_sprites_top is
signal clk_25M: std_logic;
signal clk_190H: std_logic;
signal out_pulse: std_logic;
signal rom1_a: std_logic_vector (13 downto 0);
signal cat_data: std_logic_vector (11 downto 0);
signal rom2_a: std_logic_vector (14 downto 0);
signal ball_data: std_logic_vector (11 downto 0);
signal hor_count: std_logic_vector (9 downto 0);
signal ver_count: std_logic_vector (9 downto 0);
signal vid_on: std_logic;
signal load_reg: std_logic;
signal cat_address: std_logic_vector (13 downto 0);
signal ball_address: std_logic_vector (14 downto 0);

begin
    U1: entity work.clk_div port map(
        mclk => MCLK,
        clr => CLR,
        clk_25 => clk_25M,
        clk_190 => clk_190H
    );

    U2: entity work.clk_pulse port map(
        clk_190 => clk_190H,
        clr => CLR,
        go => GO,
        pulse => out_pulse
    );
    
    U3: entity work.cat64x128_wrapper port map(
        addr_cat => rom1_a,
        clk_cat => clk_25M,
        dout_cat => cat_data
    );

    U4: entity work.ball64x448_wrapper port map(
        addr_ball => rom2_a,
        clk_ball => clk_25M,
        dout_ball => ball_data
    );

    U5: entity work.sprite_m port map(
        clk_190 => clk_190H,
        clr => CLR,
        pulse => out_pulse,
        ld_reg => load_reg,
        cat_addr => cat_address,
        ball_addr => ball_address
    );

    U6: entity work.vga_controller port map(
        clk_25 => clk_25M,
        clr => CLR,
        hc => hor_count,
        vc => ver_count,
        hsync => HSYNC,
        vsync => VSYNC,
        vidon => vid_on
    );

    U7: entity work.vga_pixels port map(
        clk_25 => clk_25M,
        clr => CLR,
        ld_reg => load_reg,
        hc => hor_count,
        vc => ver_count,
        vidon => vid_on,
        cat_addr => cat_address,
        ball_addr => ball_address,
        dout_cat => cat_data,
        dout_ball => ball_data,
        rom1_addr => rom1_a,
        rom2_addr => rom2_a,
        red => RED,
        green => GREEN,
        blue => BLUE
    );

end Behavioral;
