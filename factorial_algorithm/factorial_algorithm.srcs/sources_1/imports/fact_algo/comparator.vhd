library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator is
    port(   inp1,inp2 : in std_logic_vector (2 downto 0);
            g,e,l : out std_logic);
end comparator;

architecture Behavioral of comparator is

begin
    process (inp1,inp2)
    begin
        if (inp1 > inp2) then
            g <= '1';
            e <= '0';
            l <= '0';
        elsif (inp1 = inp2) then
            g <= '0';
            e <= '1';
            l <= '0';
        else
            g <= '0';
            e <= '0';
            l <= '1';
        end if;
    end process;

end Behavioral;
