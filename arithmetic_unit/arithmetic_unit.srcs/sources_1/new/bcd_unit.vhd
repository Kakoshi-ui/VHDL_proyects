library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bcd_unit is
    port(   s_mux1 : in std_logic_vector (3 downto 0);
            s_bcd_unit : out std_logic_vector (6 downto 0));
end bcd_unit;

architecture Behavioral of bcd_unit is

begin
    with s_mux1 select
        s_bcd_unit <=   "0000001" when "0000",
                        "1001111" when "0001",
                        "0010010" when "0010",
                        "0000110" when "0011",
                        "1001100" when "0100",
                        "0100100" when "0101",
                        "0100000" when "0110",
                        "0001111" when "0111",
                        "0000000" when "1000",
                        "0000100" when "1001",
                        "1111111" when others;

end Behavioral;
