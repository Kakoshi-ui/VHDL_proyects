library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bcd_lett is
    port(   in_comp : in std_logic_vector (2 downto 0);
            s_bcd_lett : out std_logic_vector (6 downto 0));
end bcd_lett;

architecture Behavioral of bcd_lett is

begin
    with (in_comp) select
        s_bcd_lett <=   "0110000" when "100",
                        "0100000" when "010",
                        "1110001" when "001",
                        "1111111" when others;
end Behavioral;
