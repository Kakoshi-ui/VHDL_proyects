library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_pulse_tb is
end clock_pulse_tb;

architecture Behavioral of clock_pulse_tb is
signal go_start,go_mult,clr_mult,clk,clr,go_str_out,go_outp,clr_m_outp : std_logic;

begin
    uut: entity work.clock_pulse port map(go_start,go_mult,clr_mult,clk,clr,go_str_out,go_outp,clr_m_outp);
    
    clock: process
    begin
        clk <= '0';
        wait for 20 ns;
        clk <= '1';
        wait for 20 ns;
    end process;

    stimulus: process
    begin
        clr <= '1';
        go_start <= '0';
        go_mult <= '0';
        clr_mult <= '0';
        wait for 10 us;
        
        clr <= '0';
        go_start <= '1';
        go_mult <= '1';
        clr_mult <= '1';
        wait for 10 us;
        
        clr <= '0';
        go_start <= '0';
        go_mult <= '0';
        clr_mult <= '0';
        wait for 10 us;
    end process;
end Behavioral;
