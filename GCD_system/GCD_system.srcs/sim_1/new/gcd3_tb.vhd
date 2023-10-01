library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gcd3_tb is
end gcd3_tb;

architecture Behavioral of gcd3_tb is
signal clk : std_logic;
signal clr : std_logic;
signal go : std_logic;
signal xin : std_logic_vector (3 downto 0);
signal yin : std_logic_vector (3 downto 0);
signal done : std_logic;
signal gcd : std_logic_vector (3 downto 0);

begin
uut: entity work.gcd3 port map(clk,clr,go,xin,yin,done,gcd);

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
    go <= '0';
    xin <= "0000";
    yin <= "0000";
    wait for 10 ms;
    
    clr <= '0';
    go <= '0';
    wait for 10 ms;

    xin <= "1000";
    yin <= "0100";
    wait for 20 ms;

    clr <= '0';
    go <= '1';
    wait for 20 ms;

    clr <= '0';
    go <= '0';
    wait for 20 ms;

    clr <= '1';
    go <= '0';
    wait for 40 ms;

    clr <= '0';
    go <= '0';
    wait for 20 ms;

    xin <= "1001";
    yin <= "0110";
    wait for 20 ms;

    go <= '1';
    wait for 10 ms;

    go <= '0';
    wait for 20 ms;
end process;


end Behavioral;
