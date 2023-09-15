library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bcd_desc is
    port(   s_mux2 : in std_logic_vector (3 downto 0);
            s_bcd_dec : out std_logic_vector (6 downto 0));
end bcd_desc;

architecture Behavioral of bcd_desc is

begin
    with s_mux2 select
        s_bcd_dec <=    "0000001" when "0000",
                        "1001111" when "0001",
                        "0010010" when "0010",
                        "0000110" when "0011",
                        "1001100" when "0100",
                        "0100100" when "0101",
                        "0100000" when "0110",
                        "0001111" when "0111",
                        "0000000" when "1000",
                        "0000100" when "1001",
                        "0000001" when "1011",
                        "1111110" when "1111",
                        "1111111" when others;

end Behavioral;
