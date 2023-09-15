library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux2 is
    port(   in_desc : in std_logic_vector (3 downto 0);
            in_a : in std_logic_vector (3 downto 0);
            sel : in std_logic_vector (2 downto 0);
            s_mux2 : out std_logic_vector(3 downto 0));
end mux2;

architecture Behavioral of mux2 is

begin
    with (sel) select
        s_mux2 <=   in_a when "000",
                    in_desc when "001",
                    in_desc when "010",
                    "0000" when others;
end Behavioral;
