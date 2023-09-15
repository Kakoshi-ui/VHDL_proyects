library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clockdiv is
    port(   clk : in std_logic;
            clr : in std_logic;
            clk190 : out std_logic;
            clk25 : out std_logic);
end clockdiv;

architecture Behavioral of clockdiv is
signal counter1 : std_logic_vector (17 downto 0);
signal counter2 : std_logic_vector (2 downto 0);
signal tmp_sign1 : std_logic;
signal tmp_sign2 : std_logic;

begin
clk_190: process(clk,clr)
    begin
    if (clr = '1') then
        counter1 <= (others => '0');
    elsif (clk'event and clk = '1') then
        counter1 <= counter1 + 1;
        if (counter1(17) = '1') then
            tmp_sign1 <= not tmp_sign1;
            counter1 <= (others => '0'); 
        end if;
    end if;
end process clk_190;

clk_25: process(clk,clr)
    begin
    if (clr = '1') then
        counter2 <= (others => '0');
    elsif (clk'event and clk = '1') then
        counter2 <= counter2 + 1;
        if (counter2(2) = '1') then
            tmp_sign2 <= not tmp_sign2;
            counter2 <= (others => '0');
        end if;
    end if;
end process clk_25;

end Behavioral;
