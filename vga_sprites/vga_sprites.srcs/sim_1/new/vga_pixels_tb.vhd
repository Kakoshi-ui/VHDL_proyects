----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/07/2024 01:04:14 PM
-- Design Name: 
-- Module Name: vga_pixels_tb - Behavioral
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

entity vga_pixels_tb is
end vga_pixels_tb;

architecture Behavioral of vga_pixels_tb is
signal clk_25: std_logic;
signal clr: std_logic;
signal ld_reg: std_logic:='0';
signal hc: std_logic_vector (9 downto 0);
signal vc: std_logic_vector (9 downto 0);
signal vidon: std_logic;
signal cat_addr: std_logic_vector (13 downto 0):=(others => '0');
signal ball_addr: std_logic_vector (14 downto 0):=(others => '0');
signal dout_cat: std_logic_vector (11 downto 0);
signal dout_ball: std_logic_vector (11 downto 0);
signal rom1_addr: std_logic_vector (13 downto 0);
signal rom2_addr: std_logic_vector (14 downto 0);
signal red: std_logic_vector (3 downto 0);
signal green: std_logic_vector (3 downto 0);
signal blue: std_logic_vector (3 downto 0);
signal vsenable: std_logic;

begin
    uut: entity work.vga_pixels port map(
        clk_25,
        clr,
        ld_reg,
        hc,
        vc,
        vidon,
        cat_addr,
        ball_addr,
        dout_cat,
        dout_ball,
        rom1_addr,
        rom2_addr,
        red,
        green,
        blue);

    clock: process
    begin
        clk_25 <= '0';
        wait for 20 ns;

        clk_25 <= '1';
        wait for 20 ns;
    end process clock;

    hc_count: process(clr, clk_25)
    begin
        if (clr = '1') then
            hc <= (others => '0');
        elsif (rising_edge(clk_25)) then
            if (hc = "1100100000" - 1) then
                hc <= (others => '0');
                vsenable <= '1';
            else
                hc <= hc+1;
                vsenable <= '0';
            end if;
        end if;
    end process hc_count;

    vc_count: process(clr, clk_25)
    begin
        if (clr = '1') then
            vc <= (others => '0');
        elsif (rising_edge(clk_25) and vsenable = '1') then
            if (vc = "1000001101" - 1) then
                vc <= (others => '0');
            else
                vc <= vc+1;
            end if;
        end if;
    end process vc_count;

    vidon <= '1' when (((hc<"1100010000")and(hc>="0010010000"))
    and ((vc<"1000000011")and(vc>="0000100011"))) else '0';

    data_out: process(clk_25)
    begin
        if clr = '1' then
            dout_cat <= (others => '0');
            dout_ball <= (others => '0');
        elsif (rising_edge(clk_25)) then
            if dout_cat > "1000000" then
                dout_cat <= (others => '0');
                dout_ball <= (others => '0');
            else
                dout_cat <= dout_cat + 1;
                dout_ball <= dout_ball + 1;
            end if;
        end if;
    end process data_out;

    stimulus: process
    begin
        clr <= '1';
        wait for 10 ms;

        clr <= '0';
        wait for 10 ms;

        cat_addr <= "00000000000001";
        ball_addr <= "000000000000001";
        ld_reg <= '1';
        wait for 10 ms;

        ld_reg <= '0';
        wait for 200 ms;

        cat_addr <= "00000000000010";
        ball_addr <= "000000000000010";
        ld_reg <= '1';
        wait for 10 ms;

        ld_reg <= '0';
        wait for 5000 ms;
    end process stimulus;
end Behavioral;
