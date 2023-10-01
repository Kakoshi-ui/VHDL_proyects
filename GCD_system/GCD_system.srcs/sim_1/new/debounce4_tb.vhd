library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity debounce4_tb is
end debounce4_tb;

architecture Behavioral of debounce4_tb is
signal cclk,clr : std_logic;
signal inp : std_logic;
signal outp : std_logic;

begin
uut: entity work.debounce4 port map(cclk,clr,inp,outp);

clock: process
begin
    cclk <= '0';
    wait for 2 ms;

    cclk <= '1';
    wait for 2 ms;
end process;

stimulus: process
begin
    clr <= '1';
    inp <= '0';
    wait for 5 ms;

    clr <= '0';
    inp <= '1';
    wait for 15 ms;

    inp <= '0';
    wait for 500 us;

    inp <= '1';
    wait for 800 us;
    inp <= '0';
    wait for 700 us;
    inp <= '1';
    wait for 200 us;
    inp <= '0'; 
    wait for 10 ms;
    inp <= '1';
    wait for 500 us;
    inp <= '0';
    wait for 700 us;
    inp <= '1';
    wait for 150 us;
    inp <= '0';
    wait for 125 us;
    
end process;

end Behavioral;
