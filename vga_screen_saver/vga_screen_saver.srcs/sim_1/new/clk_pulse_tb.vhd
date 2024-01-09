library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clk_pulse_tb is
end clk_pulse_tb;

architecture Behavioral of clk_pulse_tb is
signal clk, clr, inp, outp: std_logic; 

begin
    uut: entity work.clk_pulse port map(clk, clr, inp, outp);
    
    clock: process
    begin
        clk <= '0';
        wait for 2.6315 ms;
        
        clk <= '1';
        wait for 2.6315 ms;
    end process clock;
    
    stimulus: process
    begin
        clr <= '1';
        inp <= '0';
        wait for 20 ms;
        
        clr <= '0';
        wait for 10 ms;
        
        inp <= '1';
        wait for 50 ms;
        
        inp <= '0';
        wait for 250 ms;
        
    end process stimulus;
end Behavioral;