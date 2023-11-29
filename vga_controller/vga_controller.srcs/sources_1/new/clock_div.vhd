library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clk_div is
	port(	clk, clr: in std_logic;
			clkx: out std_logic);
end clk_div;

architecture Behavioral of clk_div is
signal counter: std_logic_vector (1 downto 0);
signal tmp: std_logic := '1';

begin
    process(clk, clr)
    begin
        if(clr = '1') then
            counter <= "00";
        elsif (clk'event and clk = '1') then
            if(counter(0) = '0') then
                tmp <= not tmp;
				clkx <= tmp;
                counter <= "00";
			else
				counter <= counter + 1;
            end if;
        end if;
    end process;
end Behavioral;
