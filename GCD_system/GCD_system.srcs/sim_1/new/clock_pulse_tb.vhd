library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_pulse_tb is
end clock_pulse_tb;

architecture Behavioral of clock_pulse_tb is
signal inp, cclk, clr : std_logic;
signal outp : std_logic;

begin
uut: entity work.clock_pulse port map(inp,cclk,clr,outp);

clock: process
begin
    cclk <= '0';
    wait for 20 ns;

    cclk <= '1';
    wait for 20 ns;
end process;

stimulus: process
begin
    clr <= '1';
    wait for 1 ms;

    clr <= '0';
    inp <= '1';
    wait for 5 ms;

    inp <= '0';
    wait for 5 ms;

    inp <= '1';
    wait for 4 ms;

    inp <= '0';
    wait for 10 ms;

    inp <= '1';
    wait for 5 ms;

    inp <= '0';
    wait for 10 ms;

    inp <= '1';
    wait for 30 ms;

    inp <= '0';
    wait for 10 ms;
end process;

end Behavioral;
