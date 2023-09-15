library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clockdiv is
    port(   clk : in std_logic;
            clr : in std_logic;
            clk190: out std_logic);
end clockdiv;

architecture Behavioral of clockdiv is
signal counter : std_logic_vector (17 downto 0);
signal temp_clk : std_logic := '1';

begin
clock: process(clk,clr)
    begin
        if(clr = '1') then
            counter <= (others => '0');
        elsif (clk'event and clk = '1') then
            counter <= counter+1;
            if (counter(17) = '1') then
                temp_clk <= not temp_clk;
                clk190 <= temp_clk;
                counter <= (others => '0');
            end if;
        end if;
    end process clock;

end Behavioral;
