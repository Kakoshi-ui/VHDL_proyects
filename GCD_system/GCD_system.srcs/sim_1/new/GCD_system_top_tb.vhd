library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GCD_system_top_tb is
end GCD_system_top_tb;

architecture Behavioral of GCD_system_top_tb is
signal CLK : std_logic;
signal CLR : std_logic;
signal INP : std_logic;
signal XIN : std_logic_vector (3 downto 0);
signal YIN : std_logic_vector (3 downto 0);
signal A_TO_G : std_logic_vector (6 downto 0);
signal AN : std_logic_vector (3 downto 0);

begin
uut: entity work.GCD_system_top port map(CLK,CLR,INP,XIN,YIN,A_TO_G,AN);

clock: process
begin
    CLK <= '0';
    wait for 5 ns;

    CLK <= '1';
    wait for 5 ns;
end process;

stimulus: process
begin
    CLR <= '1';
    INP <= '0';
    XIN <= "0000";
    YIN <= "0000";
    wait for 10 ms;

    CLR <= '0';
    INP <= '0';
    XIN <= "0000";
    YIN <= "0000";
    wait for 40 ms;

    XIN <= "1000";
    YIN <= "0100";
    wait for 20 ms;

    INP <= '1';
    wait for 10 ms;
    INP <= '0';
    wait for 20 ms;

    CLR <= '1';
    wait for 10 ms;
    CLR <= '0';
    wait for 10 ms;

    XIN <= "1001";
    YIN <= "0110";
    wait for 20 ms;

    INP <= '1';
    wait for 10 ms;
    INP <= '0';
    wait for 10 ms;
end process;
end Behavioral;
