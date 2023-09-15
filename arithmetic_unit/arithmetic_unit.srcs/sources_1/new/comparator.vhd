library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity comparator is
    port(   a : in std_logic_vector (3 downto 0);
            b : in std_logic_vector (3 downto 0);
            e : out std_logic;
			g : out std_logic;
			l : out std_logic);
end comparator;

architecture Behavioral of comparator is
begin
    process(a,b)
	begin
        if (a = b) then
            e <= '1';
			g <= '0';
			l <= '0';
        elsif (a > b) then
            e <= '0';
			g <= '1';
			l <= '0';
        else
            e <= '0';
			g <= '0';
			l <= '1';
        end if;
    end process;
end Behavioral;
