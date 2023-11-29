library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity prom_initials_tb is
end prom_initials_tb;

architecture Behavioral of prom_initials_tb is
signal addr: std_logic_vector(3 downto 0);
signal M: std_logic_vector(39 downto 0);

begin
    uut: entity work.prom_initials port map(addr, M);

    stimulus: process
    begin
        addr <= "0000";
        wait for 50 ns;

        addr <= "0001";
        wait for 50 ns;

        addr <= "0010";
        wait for 50 ns;
        addr <= "0011";
        wait for 50 ns;
    end process;
end Behavioral;
