library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux3 is
    port(   in_bcd_unit : in std_logic_vector (6 downto 0);
            in_bcd_lett : in std_logic_vector (6 downto 0);
            sel : in std_logic_vector (2 downto 0);
            sal_mux : out std_logic_vector (6 downto 0));
end mux3;

architecture Behavioral of mux3 is

begin
    with (sel) select
        sal_mux <=  in_bcd_unit when "000",
                    in_bcd_unit when "001",
                    in_bcd_unit when "010",
                    in_bcd_lett when "100",
                    "1111111" when others;
end Behavioral;
