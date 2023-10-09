library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clock_div is
    port(   clk : in std_logic;
            clr : in std_logic;
            clk25 : out std_logic;
            clk190 : out std_logic
        );
end clock_div;

architecture Behavioral of clock_div is
signal counter : std_logic_vector (1 downto 0);
signal counter1 : std_logic_vector (17 downto 0);
signal tmp_clk : std_logic := '1';
signal tmp_clk1 : std_logic := '1';

begin
    clk_25: process (clk,clr)
    begin
        if (clr = '1') then
            counter <= "00";
            clk25 <= not tmp_clk;
        elsif (rising_edge(clk)) then
            counter <= counter+1;
            if (counter(1) = '1') then
                tmp_clk <= not tmp_clk;
                clk25 <= tmp_clk;
                counter <= "00";
            end if;
        end if;
    end process clk_25;
    
    clk_190: process (clk,clr)
    begin
        if (clr = '1') then
            counter1 <= (others => '0');
            clk190 <= not tmp_clk1;
        elsif (rising_edge(clk)) then
            counter1 <= counter1+1;
            if (counter1(17) = '1') then
                tmp_clk1 <= not tmp_clk1;
                clk190 <= tmp_clk1;
                counter1 <= (others => '0');
            end if;
        end if;
    end process clk_190;
end Behavioral;
