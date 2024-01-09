----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/02/2024 11:06:35 AM
-- Design Name: 
-- Module Name: vga_pixels - Behavioral
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

entity vga_pixels is
    port(   clk_25: in std_logic;
            clr: in std_logic;
            ld_reg: in std_logic;
            hc: in std_logic_vector (9 downto 0);
            vc: in std_logic_vector (9 downto 0);
            vidon: in std_logic;
            cat_addr:  in std_logic_vector (13 downto 0);
            ball_addr: in std_logic_vector (14 downto 0);
            dout_cat:  in std_logic_vector (11 downto 0);
            dout_ball: in std_logic_vector (11 downto 0);
            rom1_addr: out std_logic_vector (13 downto 0);
            rom2_addr: out std_logic_vector (14 downto 0);
            red:    out std_logic_vector (3 downto 0);
            green:  out std_logic_vector (3 downto 0);
            blue:   out std_logic_vector (3 downto 0));
end vga_pixels;

architecture Behavioral of vga_pixels is
--screen timing
constant hbp: std_logic_vector (9 downto 0):= "0010010000"; 
constant vbp: std_logic_vector (9 downto 0):= "0000100011";

--dimensions of the sprites: 64x64 every frame
constant s_dim: std_logic_vector (6 downto 0):= "1000000";
constant ds_dim: std_logic_vector (7 downto 0):= "10000000";

--column and row position
constant R1: std_logic_vector (9 downto 0):= "0011110000";
constant C1: std_logic_vector (9 downto 0):= "0011110000";

--detects the sprites regions in the screen
signal sprite_cat: std_logic;
signal sprite_ball: std_logic;

--mem control
constant pixel_num: std_logic_vector (12 downto 0) := "1000000000000";
signal cat_counter: std_logic_vector (13 downto 0);
signal ball_counter: std_logic_vector (14 downto 0);

--registers
signal temp_cat_add: std_logic_vector (13 downto 0);
signal temp_ball_add: std_logic_vector (14 downto 0);

begin
    --sprite_cat = 1 when its in the range to display the image
    sprite_cat <= '1' when ((hc >= C1+hbp) and (hc < C1+hbp+s_dim)) 
    and ((vc >= R1+vbp) and (vc < R1+s_dim+vbp)) else '0';
    
    --sprite_ball = 1 when its in the range to display the image
    sprite_ball <= '1' when ((hc >= C1+hbp+s_dim) and (hc < C1+hbp+ds_dim))
    and ((vc >= R1+vbp) and (vc < R1+vbp+s_dim)) else '0';

    reg: process (clk_25, clr, ld_reg)
    begin
        if (clr = '1') then
            temp_cat_add <= (others => '0');
            temp_ball_add <= (others => '0');
        elsif (rising_edge(clk_25)) then
            if (ld_reg = '1') then
                temp_cat_add <= cat_addr;
                temp_ball_add <= ball_addr;
            end if;
        end if;
    end process reg;
    
    count_scat: process (clk_25, clr, sprite_cat, vidon)
    begin
        if (clr = '1') then
            cat_counter <= (others => '0');
        elsif (rising_edge(clk_25) and vidon = '1' and sprite_cat = '1') then
            if (cat_counter = pixel_num - 1) then
                cat_counter <= (others => '0');
            else
                cat_counter <= cat_counter + 1;
            end if;
        end if;
    end process count_scat;
    rom1_addr <= temp_cat_add + cat_counter;

    count_sball: process(clk_25, sprite_ball, vidon)
    begin
        if (clr = '1') then
            ball_counter <= (others => '0');
        elsif (rising_edge(clk_25) and vidon = '1' and sprite_ball = '1') then
            if (ball_counter = pixel_num - 1) then
                ball_counter <= (others => '0');
            else
                ball_counter <= ball_counter + 1;
            end if;
        end if;
    end process;
    rom2_addr <= temp_ball_add + ball_counter;

    show_pixels: process(sprite_cat, sprite_ball, vidon)
    begin
        red <= "0000";
        green <= "0000";
        blue <= "0000";
        if (sprite_cat = '1' and vidon <= '1') then
            red <= dout_cat(3 downto 0);
            green <= dout_cat(7 downto 4);
            blue <= dout_cat(11 downto 8);
        elsif (sprite_ball = '1' and vidon = '1') then
            red <= dout_ball(3 downto 0);
            green <= dout_ball(7 downto 4);
            blue <= dout_ball(11 downto 8);
        end if;
    end process show_pixels;

end Behavioral;
