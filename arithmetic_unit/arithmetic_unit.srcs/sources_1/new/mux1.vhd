library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux1 is
    port(   in_sum : in std_logic_vector(7 downto 0);
            in_res : in std_logic_vector (7 downto 0);
            in_b : in std_logic_vector (7 downto 0);
            sel : in std_logic_vector (2 downto 0);
            s_mux1 : out std_logic_vector (7 downto 0));
end mux1;

architecture Behavioral of mux1 is

begin
    with (sel) select
        s_mux1 <=   in_b when "000",
                    in_sum when "001",
                    in_res when "010",
                    "00000000" when others;
end Behavioral;
