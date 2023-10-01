library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity X7segb_tb is
end X7segb_tb;

architecture Behavioral of X7segb_tb is
signal x : std_logic_vector (15 downto 0);
signal cclk, clr : std_logic;
signal a_to_g : std_logic_vector (6 downto 0);
signal an : std_logic_vector (3 downto 0);

begin
uut: entity work.X7segb port map(x,cclk,clr,a_to_g,an);

clock: process
begin
    cclk <= '0';
    wait for 2.6315 ms;

    cclk <= '1';
    wait for 2.6315 ms;
end process;

stimulus: process
begin
    clr <= '1';
    x <= (others => '0');
    wait for 50 ms;

    clr <= '0';
    x <= "0000000000001001";
    wait for 1000 ms;

end process;


end Behavioral;
