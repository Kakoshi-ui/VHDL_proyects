library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clk_div is
    port (  clk: in std_logic;
            clr: in std_logic;
            clk_25M: out std_logic;
            clk_190k: out std_logic);
end clk_div;

architecture Behavioral of clk_div is
signal counter_190: std_logic_vector(18 downto 0);
signal tmp_190: std_logic := '0';
signal counter_25: std_logic_vector (1 downto 0);
signal tmp_25: std_logic := '0';

begin
    clock_190: process(clr, clk)
    begin
        if (clr = '1') then
            counter_190 <= (others => '0');
        elsif (rising_edge(clk)) then
            if(counter_190(18) = '1') then
                counter_190 <= (others => '0');
                tmp_190 <= not tmp_190;
            else
                counter_190 <= counter_190 + 1;
            end if;
        end if;
    end process clock_190;
    clk_190k <= tmp_190;
    
    clock_25: process(clr, clk)
    begin
        if (clr = '1') then
            counter_25 <= "00";
        elsif(rising_edge(clk)) then
            if (counter_25(0) = '1') then
                counter_25 <= "00";
                tmp_25 <= not tmp_25;
            else
                counter_25 <= counter_25 + 1;
            end if;
        end if;
    end process clock_25;
    clk_25M <= tmp_25;
    
end Behavioral;