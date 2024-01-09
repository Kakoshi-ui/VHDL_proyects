----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/03/2024 06:39:59 PM
-- Design Name: 
-- Module Name: sprite_m - Behavioral
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

entity sprite_m is
    port(   clk_190: in std_logic;
            clr: in std_logic;
            pulse: in std_logic;
            ld_reg: out std_logic;
            cat_addr: out std_logic_vector (13 downto 0);
            ball_addr: out std_logic_vector (14 downto 0));
end sprite_m;

architecture Behavioral of sprite_m is
type state_type is (q0, q1, q2, q3, q4, q5 ,q6, q7);
signal present_state, next_state: state_type;
signal count: std_logic_vector (5 downto 0);
signal frames: std_logic_vector (2 downto 0);
signal next_sprite: std_logic;
signal counter_en: std_logic;

begin
    reg: process(clk_190, clr, pulse, frames)
    begin
        if (clr = '1') then
            counter_en <= '0';
        elsif (rising_edge(clk_190)) then
            if (pulse = '1') then
                counter_en <= '1';
            elsif (frames = "111") then
                counter_en <= '0';
            end if;
        end if;
    end process reg;

    counter: process(clk_190, clr, counter_en)
    begin
        if (clr = '1' or counter_en = '0') then
            count <= "000000";
        elsif (rising_edge(clk_190) and (counter_en = '1')) then
            if (count = "110000") then
                count <= "000000";
                next_sprite <= '1';
                ld_reg <= '1';
            else
                count <= count + 1;
                next_sprite <= '0';
                ld_reg <= '0';
            end if;
        end if;
    end process counter;
    
    frame_c: process(clr, clk_190, next_sprite, counter_en)
    begin
        if (clr = '1' or counter_en = '0') then
            frames <= "000";
        elsif(rising_edge(clk_190) and (next_sprite = '1') and (counter_en = '1')) then
            if (frames = "111") then
                frames <= "000";
            else
                frames <= frames + 1;
            end if;
        end if;
    end process frame_c;
    
    state_register: process(clk_190, clr)
    begin
        if(clr = '1') then
            present_state <= q0;
        elsif (rising_edge(clk_190)) then
            present_state <= next_state;
        end if;
    end process state_register;

    C1: process(present_state, frames, pulse)
    begin
        case (present_state) is
            when q0 =>
                if (pulse = '0') then
                    next_state <= q0;
                else
                    next_state <= q1;
                end if;
            when q1 =>
                if (frames = "001") then
                    next_state <= q2;
                else 
                    next_state <= q1;
                end if;
            when q2 =>
                if (frames = "010") then
                    next_state <= q3;
                else
                    next_state <= q2;
                end if;
            when q3 =>
                if (frames = "011") then
                    next_state <= q4;
                else
                    next_state <= q3;
                end if;
            when q4 =>
                if (frames = "100") then
                    next_state <= q5;
                else
                    next_state <= q4;
                end if;
            when q5 =>
                if (frames = "101") then
                    next_state <= q6;
                else
                    next_state <= q5;
                end if;
            when q6 =>
                if (frames = "110") then
                    next_state <= q7;
                else
                    next_state <= q6;
                end if;
            when q7 =>
                if (frames = "111") then
                    next_state <= q0;
                else
                    next_state <= q7;
                end if;
            when others =>
                null;
        end case;
    end process C1;

    C2: process(present_state)
    begin
        if (present_state = q0) then
            cat_addr <= (others => '0');
            ball_addr <= (others => '0'); 
        elsif (present_state = q1) then
            cat_addr <= (others => '0');
            ball_addr <= (others => '0');
        elsif (present_state = q2) then
            cat_addr <= "01000000000000";
            ball_addr <= "001000000000000";
        elsif (present_state = q3) then
            cat_addr <= "01000000000000";
            ball_addr <= "010000000000000";
        elsif (present_state = q4) then
            cat_addr <= (others => '0');
            ball_addr <= "011000000000000";
        elsif (present_state = q5) then
            cat_addr <= (others => '0');
            ball_addr <= "100000000000000";
        elsif (present_state = q6) then
            cat_addr <= (others => '0');
            ball_addr <= "101000000000000";
        elsif (present_state = q7) then
            cat_addr <= (others => '0');
            ball_addr <= "110000000000000";
        else 
            cat_addr <= (others => '0');
            ball_addr <= (others => '0');
        end if;
    end process C2;

end Behavioral;
